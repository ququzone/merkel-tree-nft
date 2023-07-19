// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "solmate/src/auth/Owned.sol";
import {ERC721} from "solmate/src/tokens/ERC721.sol";

contract OwnedNFT is ERC721, Owned {
    string private uri;
    uint256 public nextTokenId;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _uri
    ) Owned(msg.sender) ERC721(_name, _symbol) {
        uri = _uri;
    }

    function mint(address account) external onlyOwner {
        _safeMint(account, ++nextTokenId);
    }

    function batchMint(address[] calldata accounts) external onlyOwner {
        for (uint i = 0; i < accounts.length; i++) {
            _safeMint(accounts[i], ++nextTokenId);
        }
    }

    function tokenURI(uint256) public view virtual override returns (string memory) {
        return uri;
    }
}
