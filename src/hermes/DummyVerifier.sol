// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DummyVerifier {
    function description() external pure returns (string memory) {
        return "Dummy Verifier";
    }

    function verify(bytes memory) external pure returns (bool) {
        return true;
    }
}
