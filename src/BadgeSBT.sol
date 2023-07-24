// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "solmate/src/auth/Owned.sol";
import {ERC1155} from "solmate/src/tokens/ERC1155.sol";

contract BadgeSBT is Owned, ERC1155 {
    event Locked(uint256 indexed tokenId);
    event Unlocked(uint256 indexed tokenId);

    event OperatorAdded(address indexed operator);
    event OperatorRemoved(address indexed operator);
    event BaseUriChanged(string uri);

    error BadgeNotExist(uint256 tokenId);
    error TokenIsSoulbound();

    mapping(address => bool) public operators;
    mapping(uint256 => bool) private badges;
    string public baseUri;
    uint256 public nextBadgeId;

    modifier onlyOperator() virtual {
        require(operators[msg.sender], "ONLY_OPERATOR");
        _;
    }

    constructor(string memory _baseUri) Owned(msg.sender) {
        baseUri = _baseUri;
        emit BaseUriChanged(_baseUri);
    }

    function newBadge() external onlyOperator returns (uint256) {
        uint256 newItemId = ++nextBadgeId;
        badges[newItemId] = true;
        emit Locked(newItemId);
        return newItemId;
    }

    function addOperator(address operator) external onlyOwner {
        operators[operator] = true;
        emit OperatorAdded(operator);
    }

    function removeOperator(address operator) external onlyOwner {
        operators[operator] = false;
        emit OperatorRemoved(operator);
    }

    function changeBaseUri(string memory _baseUri) external onlyOwner {
        baseUri = _baseUri;
        emit BaseUriChanged(_baseUri);
    }

    function mint(address recipient, uint256 badgeId) public payable onlyOperator {
        if (badges[badgeId] != true) {
            revert BadgeNotExist(badgeId);
        }
        _mint(recipient, badgeId, 1, "");
    }

    function onlySoulbound(address from, address to) internal pure {
        if (from != address(0) && to != address(0)) {
            revert TokenIsSoulbound();
        }
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes calldata data
    ) public virtual override {
        onlySoulbound(from, to);
        super.safeTransferFrom(from, to, id, amount, data);
    }

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts,
        bytes calldata data
    ) public virtual override {
        onlySoulbound(from, to);
        super.safeBatchTransferFrom(from, to, ids, amounts, data);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return
            interfaceId == 0xb45a3c0e || // ERC165 Interface ID for ERC5192
            super.supportsInterface(interfaceId);
    }

    function uri(uint256 tokenId) public view virtual override returns (string memory) {
        return string(abi.encodePacked(baseUri, toString(tokenId), ".json"));
    }

    function locked(
        uint256 /*tokenId*/
    ) external pure returns (bool) {
        return true;
    }

    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
