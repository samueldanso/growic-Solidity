// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackExample {

    // Fallback function - Called when a user transfers ETH to the smart contract
    receive() external payable {
        // Do nothing, just receive the Ether
    }
}
