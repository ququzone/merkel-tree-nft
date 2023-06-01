// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "solmate/src/tokens/ERC721.sol";

contract W3bstreamDevnetLaunch is ERC721 {
    address internal constant SENTINEL = address(0x1);

    uint256 public startTime;
    uint256 public endTime;
    uint256 public total;
    mapping(address => address) private minted;
    string private uri;

    constructor(
        uint256 _startTime,
        uint256 _endTime,
        string memory _uri
    ) ERC721("W3bstream Devnet Launch", "WDL") {
        require(_startTime > block.timestamp && _endTime > _startTime, "invalid time");
        startTime = _startTime;
        endTime = _endTime;
        uri = _uri;
        minted[SENTINEL] = address(this);
    }

    function isMinted(address account) public view returns (bool) {
        return minted[account] != address(0);
    }

    function mint() external {
        require(minted[msg.sender] == address(0), "already minted");
        require(startTime <= block.timestamp && endTime >= block.timestamp, "error mint time");
        minted[msg.sender] = minted[SENTINEL];
        minted[SENTINEL] = msg.sender;

        _safeMint(msg.sender, ++total);
    }

    function tokenURI(uint256) public view virtual override returns (string memory) {
        return uri;
    }
}
