// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Owned} from "solmate/src/auth/Owned.sol";
import {LibString} from "solmate/src/utils/LibString.sol";
import {ERC721} from "solmate/src/tokens/ERC721.sol";

contract IoTeXFans is Owned, ERC721 {
    using LibString for uint256;

    string private uri;
    uint256 public nextTokenId;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _uri
    ) Owned(msg.sender) ERC721(_name, _symbol) {
        uri = _uri;
    }

    function mint(address user) external onlyOwner {
        _safeMint(user, ++nextTokenId);
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        return string.concat(uri, tokenId.toString(), ".json");
    }
}
