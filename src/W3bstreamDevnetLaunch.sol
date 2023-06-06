// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "solmate/src/tokens/ERC721.sol";

contract W3bstreamDevnetLaunch is ERC721 {
    uint256 public startTime;
    uint256 public endTime;
    uint256 public total;
    uint256 public fee;
    address public feeCollector;
    mapping(address => bool) private minted;
    string private uri;

    constructor(
        uint256 _startTime,
        uint256 _endTime,
        uint256 _fee,
        address _feeCollector,
        string memory _uri
    ) ERC721("W3bstream Devnet Launch", "WDL") {
        require(_startTime > block.timestamp && _endTime > _startTime, "invalid time");
        startTime = _startTime;
        endTime = _endTime;
        fee = _fee * 10**18;
        feeCollector = _feeCollector;
        uri = _uri;
    }

    function isMinted(address account) public view returns (bool) {
        return minted[account];
    }

    function mint() external payable {
        require(msg.value >= fee, "too low fee");
        require(!minted[msg.sender], "already minted");
        require(startTime <= block.timestamp && endTime >= block.timestamp, "error mint time");
        minted[msg.sender] = true;
        payable(feeCollector).transfer(msg.value);

        _safeMint(msg.sender, ++total);
    }

    function tokenURI(uint256) public view virtual override returns (string memory) {
        return uri;
    }
}
