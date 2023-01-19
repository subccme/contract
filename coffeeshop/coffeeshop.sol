// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CoffeeShop {
    address payable owner;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "You must deposit a positive amount.");
        balances[msg.sender] += msg.value;
    }

    function buyCoffee() public payable {
        require(msg.value == 1 ether, "Price of coffee is 1 ether.");
        require(balances[msg.sender] >= 1 ether, "Insufficient balance.");
        balances[msg.sender] -= 1 ether;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw.");
        owner.transfer(address(this).balance);
    }
}
