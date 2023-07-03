// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "solmate/src/tokens/ERC721.sol";

contract ZKPWalletNFT is ERC721 {
    uint256 public constant TOTAL = 10_000;
    string private uri;
    uint256 public nextTokenId;

    constructor(string memory _uri) ERC721("Introducing ZKP Wallet NFT", "IZKP") {
        uri = _uri;
    }

    function mint() external payable {
        require(nextTokenId < TOTAL, "mint ended");
        _safeMint(msg.sender, ++nextTokenId);
    }

    function tokenURI(uint256) public view virtual override returns (string memory) {
        return uri;
    }
}
