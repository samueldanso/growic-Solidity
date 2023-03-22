// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract UserInfo {
    
    struct User {
        string name;
        uint256 age;
        uint256 balance;
        bool hasDeposited;
    }

    mapping(address => User) public users;
    uint256 private constant Fee = 10; // Fee in wei

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can withdraw funds");
        _;
    }

    modifier hasDeposited() {
        require(users[msg.sender].hasDeposited, "User must have deposited before increasing balance");
        _;
    }

    modifier amountGreaterThanFee(uint256 _amount) {
        require(_amount > Fee, "Amount must be greater than fee");
        _;
    }

    address payable owner;

event FundsDeposited(address user, uint256 amount); //The "FundsDeposited" event is emitted when a user deposits funds, and includes the user's address and the amount deposited as parameters.
event ProfileUpdated(address user); // The "ProfileUpdated" event is emitted when a user updates their profile information, and includes the user's address as a parameter.

    constructor() {
        owner = payable(msg.sender);
    }

    function setUserDetails(string calldata _name, uint256 _age) public {
        users[msg.sender].name = _name;
        users[msg.sender].age = _age;
        emit ProfileUpdated(msg.sender); // The "ProfileUpdated" event is emitted when a user updates their profile information, and includes the user's address as a parameter.
    }

    function getUserDetails() public view returns (string memory, uint256, uint256) {
        User memory user = users[msg.sender];
        return (user.name, user.age, user.balance);
    }

    function deposit() public payable {
        users[msg.sender].balance += msg.value;
        users[msg.sender].hasDeposited = true;
        emit FundsDeposited(msg.sender, msg.value); // emit the "FundsDeposited" event 
    }

    function addFund(uint256 _amount) public payable hasDeposited amountGreaterThanFee(_amount) {
        users[msg.sender].balance += _amount - Fee;
    }

    function withdraw(uint256 _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Insufficient balance");
        owner.transfer(_amount);
    }

    function getBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }

    function AmountToSmall() internal pure {
        revert("Amount must be greater than fee");
    }
}
