// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "solmate/src/tokens/ERC721.sol";

contract FreeMintNFT is ERC721 {
    string private uri;
    uint256 immutable startTime;
    uint256 public nextTokenId;
    mapping(address => bool) public minted;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _startTime,
        string memory _uri
    ) ERC721(_name, _symbol) {
        startTime = _startTime;
        uri = _uri;
    }

    function endTime() public view returns (uint256) {
        return startTime + 7 days;
    }

    function mint() external payable {
        require(startTime <= block.timestamp && endTime() >= block.timestamp, "Error mint time");
        require(!minted[msg.sender], "Already minted");

        minted[msg.sender] = true;
        _safeMint(msg.sender, ++nextTokenId);
    }

    function tokenURI(uint256) public view virtual override returns (string memory) {
        return uri;
    }
}
