// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "solmate/src/tokens/ERC721.sol";
import "solmate/src/auth/Owned.sol";
import "solmate/src/utils/MerkleProofLib.sol";

contract MimoFrenzyNFTBimby is Owned, ERC721 {
    bool public freeMint;
    bool public ended;
    string private uri;
    uint256 public nextTokenId;
    bytes32 public immutable merkleRoot;
    uint256 public immutable total;

    // This is a packed array of booleans.
    mapping(uint256 => uint256) private claimedBitMap;
    mapping(address => uint256) public userMinted;

    constructor(
        bytes32 _root,
        string memory _uri,
        uint256 _total
    ) Owned(msg.sender) ERC721("Mimo Frenzy Tribe - Bimby", "MFTB") {
        uri = _uri;
        merkleRoot = _root;
        total = _total;
        freeMint = true;
        ended = false;
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

    function claim(
        uint256 index,
        address account,
        bytes32[] calldata proof
    ) external {
        require(freeMint && !ended && nextTokenId < total, "MimoFrenzyNFT: Mint closed.");
        require(!isClaimed(index), "MimoFrenzyNFT: Drop already claimed.");

        // Verify the merkle proof.
        bytes32 node = keccak256(abi.encodePacked(index, account));
        require(MerkleProofLib.verify(proof, merkleRoot, node), "MimoFrenzyNFT: Invalid proof.");

        // Mark it claimed and send the token.
        userMinted[account] = 1;
        _setClaimed(index);
        _safeMint(account, ++nextTokenId);
    }

    function mint() external payable {
        require(!freeMint && !ended && nextTokenId < total, "MimoFrenzyNFT: Mint closed.");
        require(msg.value >= 99 ether, "MimoFrenzyNFT: Too low mint fee.");
        uint256 mintedAmount = userMinted[msg.sender];
        require(mintedAmount < 10, "MimoFrenzyNFT: Exceed mint limit.");

        userMinted[msg.sender] = mintedAmount + 1;
        _safeMint(msg.sender, ++nextTokenId);
    }

    function stopFreeMint() external onlyOwner {
        freeMint = false;
    }

    function stopMint() external onlyOwner {
        require(!freeMint, "MimoFrenzyNFT: stop free mint first.");
        ended = true;
    }

    function withdraw(address payable account) external onlyOwner {
        require(ended, "MimoFrenzyNFT: Mint not ended.");
        account.transfer(address(this).balance);
    }

    function tokenURI(
        uint256 /*id*/
    ) public view virtual override returns (string memory) {
        return uri;
    }
}
