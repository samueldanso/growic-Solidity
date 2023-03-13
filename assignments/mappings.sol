// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BalanceTracker {
    mapping(address => uint256) balances;

    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}