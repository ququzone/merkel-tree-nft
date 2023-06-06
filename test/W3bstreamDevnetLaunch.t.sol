// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/W3bstreamDevnetLaunch.sol";

contract MimoFrenzyNFTTest is Test {
    W3bstreamDevnetLaunch public token;

    address internal alice;
    address internal bob;
    address internal mike;
    address internal dog;
    address internal cat;
    address internal pig;
    address internal admin;

    function setUp() public {
        token = new W3bstreamDevnetLaunch(1686035899, 1686035899, 1, address(0), "");
    }
}
