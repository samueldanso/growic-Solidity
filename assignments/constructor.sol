// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    address immutable owner;
    uint immutable FEE;
    
    constructor(uint _fee) {
        owner = msg.sender;
        FEE = _fee;
    }
}

contract B is A {
    address immutable ownerB;
    
    constructor() A(20) {
        ownerB = msg.sender;
    }
    
    function getFee() public view returns(uint) {
        return FEE;
    }
}