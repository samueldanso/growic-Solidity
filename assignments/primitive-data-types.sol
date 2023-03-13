// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract DataTypesExample {
    
    /* 
    Signed integers can hold both positive and negative integers.
    They can have different sizes ranging from 8 to 256 bits. 
    */

    int8 public smallInt = -128; // smallest 8-bit signed integer
    int256 public largeInt = 2**255 - 1; // largest 256-bit signed integer

    // Example use case: Storing user balance (can be negative) or a temperature value (can be negative)
    
    /* Unsigned integers can hold only positive integers.
    They can have different sizes ranging from 8 to 256 bits.
    */

    uint8 public smallUInt = 255; // largest 8-bit unsigned integer
    uint256 public largeUInt = 2**256 - 1; // largest 256-bit unsigned integer

 // Example use case: Storing number of tokens or a user's age (cannot be negative)

    /* Boolean can only have two values: true or false. */

    bool public isActive = true; 

    // Example use case: Storing whether a user is currently active or not
    
    /* 
    Address is a 20-byte hexadecimal value (0x...).
    It represents an Ethereum account or a contract. 
    */

    address public owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    // Example use case: Storing contract owner's address or a user's wallet address
    
    /* Enum is a user-defined type that can have a finite set of values. */

    enum State { New, InProgress, Completed }
    State public currentState = State.New;

    // Example use case: Tracking state of a project or an order
    
    /* Bytes can hold a sequence of bytes (1 byte = 8 bits).*/
    
    bytes public data = hex"00112233445566778899aabbccddeeff";
    // Example use case: Storing encrypted data or a digital signature
    
}
