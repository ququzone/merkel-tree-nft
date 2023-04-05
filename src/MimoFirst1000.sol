// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "solmate/src/tokens/ERC721.sol";

contract MimoFirst1000 is ERC721 {
    string private uri;

    constructor(string memory _uri) ERC721("Mimo First 1000 NFT", "MFT") {
        uri = _uri;
    }

    function tokenURI(uint256 /*id*/) public view virtual override returns (string memory) {
        return uri;
    }
}
