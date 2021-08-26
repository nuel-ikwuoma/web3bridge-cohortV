// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "./FintechBase.sol";

contract Fintech is FintechBase {
    constructor(address[] memory _admins) FintechBase(_admins) {}

    function createCustomer(string memory _name, address _customerAddress)
        external
        isAdmin
        returns (bool)
    {
        bytes32 customerHash = keccak256(
            abi.encodePacked(
                _name,
                block.timestamp,
                nextCustomerID,
                _customerAddress
            )
        );
        if (customerExists[customerHash]) {
            return false;
        }
        Customer memory customer = Customer(
            _name,
            block.timestamp,
            nextCustomerID,
            _customerAddress
        );
        customers[customerHash] = customer;
        customersID[nextCustomerID] = _customerAddress;
        customersHash[nextCustomerID] = customerHash;
        nextCustomerID++;
        return true;
    }

    function getCustomerDetails(uint256 _id)
        external
        view
        isOwnerOrAdmin(_id, msg.sender)
        returns (Customer memory _customer)
    {
        _customer = customers[customersHash[_id]];
    }
}
