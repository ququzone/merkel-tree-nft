// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "solmate/src/tokens/ERC721.sol";
import "solmate/src/utils/MerkleProofLib.sol";

contract MimoFirst1000 is ERC721 {
    string private uri;
    uint256 private nextTokenId;
    bytes32 public immutable merkleRoot;

    // This is a packed array of booleans.
    mapping(uint256 => uint256) private claimedBitMap;

    constructor(bytes32 _root, string memory _uri) ERC721("Mimo First 1000 NFT", "MFT") {
        uri = _uri;
        merkleRoot = _root;
    }

    function isClaimed(uint256 index) public view returns (bool) {
        uint256 claimedWordIndex = index / 256;
        uint256 claimedBitIndex = index % 256;
        uint256 claimedWord = claimedBitMap[claimedWordIndex];
        uint256 mask = (1 << claimedBitIndex);
        return claimedWord & mask == mask;
    }

    function _setClaimed(uint256 index) private {
        uint256 claimedWordIndex = index / 256;
        uint256 claimedBitIndex = index % 256;
        claimedBitMap[claimedWordIndex] = claimedBitMap[claimedWordIndex] | (1 << claimedBitIndex);
    }

    function claim(uint256 index, address account, bytes32[] calldata proof) external {
        require(!isClaimed(index), 'MimoFirst1000: Drop already claimed.');

        // Verify the merkle proof.
        bytes32 node = keccak256(abi.encodePacked(index, account));
        require(MerkleProofLib.verify(proof, merkleRoot, node), 'MimoFirst1000: Invalid proof.');

        // Mark it claimed and send the token.
        _setClaimed(index);
        _mint(account, ++nextTokenId);
    }

    function tokenURI(uint256 /*id*/) public view virtual override returns (string memory) {
        return uri;
    }
}
