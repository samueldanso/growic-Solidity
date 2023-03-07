// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract BalanceTracker {
    mapping(address => uint256) balances;

    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}