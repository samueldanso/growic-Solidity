// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BalanceTracker {
    mapping(address => uint256) balances;

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
