// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/multisender/Multisender.sol";

contract NormalRecipient {
    event Payment(address indexed from, uint256 amount);

    receive() external payable {
        emit Payment(msg.sender, msg.value);
    }
}

contract IllegalRecipient {
    mapping(address => uint256) received;

    receive() external payable {
        received[msg.sender] = msg.value;
    }
}

contract NoFallback {}

contract MultisenderTest is Test {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Failure(address indexed from, address indexed to, uint256 value);

    Multisender public sender;
    address[] recipients1;
    address[] recipients2;

    function setUp() public {
        sender = new Multisender(0, 50);
        recipients1 = new address[](50);
        for (uint256 i = 0; i < 50; i++) {
            recipients1[i] = address(uint160(i + 100000));
        }

        recipients2 = new address[](4);
        recipients2[0] = address(new NormalRecipient());
        recipients2[1] = address(new IllegalRecipient());
        recipients2[2] = address(new NoFallback());
        recipients2[3] = address(10000);
    }

    function testToEOA() public {
        uint256[] memory amounts = new uint256[](50);
        uint256 total = 0;
        for (uint256 i = 0; i < 50; i++) {
            uint256 amount = 100 * (i + 1);
            total += amount;
            amounts[i] = amount;
        }
        sender.sendCoin{value: total}(recipients1, amounts, "");
        for (uint256 i = 0; i < 50; i++) {
            assertEq(recipients1[i].balance, 100 * (i + 1));
        }
    }

    function testToContract() public {
        uint256[] memory amounts = new uint256[](4);
        amounts[0] = 100;
        amounts[1] = 200;
        amounts[2] = 300;
        amounts[3] = 400;
        assertEq(recipients2[0].balance, 0);

        vm.expectEmit(true, true, false, true);
        emit Failure(address(this), recipients2[1], 200);

        sender.sendCoin{value: 1000}(recipients2, amounts, "");
        assertEq(recipients2[0].balance, 100);
        assertEq(recipients2[1].balance, 0);
        assertEq(recipients2[2].balance, 0);
        assertEq(recipients2[3].balance, 400);
    }
}
