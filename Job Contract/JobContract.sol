// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JobOffer {
    uint256 salary = 2.5 ether;
    uint256 startTime;
    uint256 endTime;

    constructor() {
        startTime = block.timestamp;
        endTime = startTime + 30 days * 12;
    }

    function getSalary() public view returns (uint256) {
        return salary;
    }

    function isValid() public view returns (bool) {
        return block.timestamp >= startTime && block.timestamp <= endTime;
    }

    function paySalary() public payable {
        require(isValid(), "Job contract is not valid");
        require(msg.value == salary, "Incorrect amount paid");
         address payable payee = payable(msg.sender);
         payee.transfer(salary);
    }
}
