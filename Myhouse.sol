// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyHouse {
    address owner;
    address renter;
    uint rent;
    uint deposit;
    uint leaseLength;
    address[] validators;
    bool valid;

    constructor(address _owner, address _renter, uint _rent, uint _deposit, uint _leaseLength, address[] memory _validators)  {
        owner = _owner;
        renter = _renter;
        rent = _rent;
        deposit = _deposit;
        leaseLength = _leaseLength;
        validators = _validators;
        valid = false;
    }

    function validate() public {
    for(uint i = 0; i < validators.length; i++) {
        if (validators[i] == msg.sender) {
            valid = true;
            return;
        }
    }
    require(false, "Sender is not a validator.");
}


    function isValid() public view returns (bool) {
        return valid;
    }

    function getRenter() public view returns (address) {
        return renter;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function getRent() public view returns (uint) {
        return rent;
    }

    function getDeposit() public view returns (uint) {
        return deposit;
    }

    function getLeaseLength() public view returns (uint) {
        return leaseLength;
    }
}
