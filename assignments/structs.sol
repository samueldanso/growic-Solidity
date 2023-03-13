// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract UserInfo {
    
    struct User {
        string name;
        uint256 age;
    }
    
    mapping(address => User) public users;
    
    function setUserDetails(string calldata name, uint256 age) public {
        User storage user = users[msg.sender];
        user.name = name;
        user.age = age;
    }
    
    function getUserDetails() public view returns (string memory, uint256) {
        User storage user = users[msg.sender];
        return (user.name, user.age);
    }
    
}