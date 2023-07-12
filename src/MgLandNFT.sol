// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MgLandNFT is ERC721 {
    event Mint(address indexed account, uint256 indexed tokenId);

    uint256 public immutable startTime;
    uint256 public immutable endTime;
    uint256 public nextTokenId;
    uint256 public immutable price = 299 ether;
    address public immutable feeCollector;

    constructor(
        uint256 _startTime,
        address _feeCollector
    ) ERC721("The Mimo Spaceship NFT", "MST") {
        startTime = _startTime;
        endTime = _startTime + 5 days;
        feeCollector = _feeCollector;
    }

    function mint() external payable {
        require(startTime <= block.timestamp && endTime >= block.timestamp, "sale end");
        require(nextTokenId < 1000, "sale out");
        require(msg.value >= price, "invalid fee");

        payable(feeCollector).transfer(msg.value);
        _mint(msg.sender, ++nextTokenId);
        emit Mint(msg.sender, nextTokenId);
    }

    function tokenURI(uint256) public view virtual override returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(
                        abi.encodePacked(
                            '{"name": "',
                            name(),
                            '", "',
                            'description": "The Mimo Spaceship NFT with MgLand", "',
                            'image":"https://dist.mg.land/nft/spaceship/mimo/base.png"',
                            '}'
                        )
                    )
                )
            );
    }
}
