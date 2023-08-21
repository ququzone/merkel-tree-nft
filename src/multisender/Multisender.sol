// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "solmate/src/auth/Owned.sol";
import "solmate/src/utils/ReentrancyGuard.sol";

interface ERC20Basic {
    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
}

interface ERC20 is ERC20Basic {
    function allowance(address owner, address spender) external view returns (uint256);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Multisender is Owned, ReentrancyGuard {
    uint256 public minTips;
    uint256 public limit;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Failure(address indexed from, address indexed to, uint256 value);
    event Receipt(address indexed token, uint256 totalAmount, uint256 tips, string payload);
    event Withdraw(address indexed owner, uint256 balance);

    constructor(uint256 _minTips, uint256 _limit) Owned(msg.sender) {
        minTips = _minTips;
        limit = _limit;
    }

    function sendCoinInternal(
        address[] calldata recipients,
        uint256[] calldata amounts,
        string calldata payload
    ) private {
        require(recipients.length == amounts.length, "mismatch data");
        require(recipients.length <= limit, "too large data");
        uint256 totalAmount = minTips;
        for (uint256 i = 0; i < recipients.length; i++) {
            if (amounts[i] == 0) {
                continue;
            }
            totalAmount += amounts[i];
            require(msg.value >= totalAmount, "insufficient amount");
            bool ok = payable(recipients[i]).send(amounts[i]);
            if (ok) {
                emit Transfer(msg.sender, recipients[i], amounts[i]);
            } else {
                emit Failure(msg.sender, recipients[i], amounts[i]);
            }
        }
        if (msg.value - totalAmount > 0) {
            payable(msg.sender).transfer(msg.value - totalAmount);
            totalAmount = msg.value;
        }
        emit Receipt(
            address(this),
            totalAmount - minTips,
            minTips + msg.value - totalAmount,
            payload
        );
    }

    function sendCoin(
        address[] calldata recipients,
        uint256[] calldata amounts,
        string calldata payload
    ) external payable nonReentrant {
        sendCoinInternal(recipients, amounts, payload);
    }

    function sendToken(
        address token,
        address[] calldata recipients,
        uint256[] calldata amounts,
        string calldata payload
    ) external payable {
        require(msg.value >= minTips, "too small tips");
        require(recipients.length == amounts.length, "mismatch data");
        require(recipients.length <= limit, "too large data");
        uint256 totalAmount = 0;
        ERC20 erc20token = ERC20(token);
        for (uint256 i = 0; i < recipients.length; i++) {
            if (amounts[i] == 0) {
                continue;
            }
            totalAmount = totalAmount + amounts[i];
            erc20token.transferFrom(msg.sender, recipients[i], amounts[i]);
        }
        emit Receipt(token, totalAmount, msg.value, payload);
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(owner).transfer(balance);
        emit Withdraw(owner, balance);
    }

    function setMinTips(uint256 _minTips) public onlyOwner {
        minTips = _minTips;
    }

    function setLimit(uint256 _limit) public onlyOwner {
        limit = _limit;
    }
}
