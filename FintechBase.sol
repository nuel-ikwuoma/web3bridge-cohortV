// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract FintechBase {
    struct Customer {
        string name;
        uint256 registeredAt;
        uint256 id;
        address customerAddress;
    }

    uint256 nextCustomerID;
    mapping(bytes32 => Customer) customers;
    mapping(uint256 => address) customersID;
    mapping(uint256 => bytes32) customersHash;
    mapping(uint256 => mapping(address => bool)) allowed;
    mapping(bytes32 => bool) customerExists;

    address[] admins;

    constructor(address[] memory _admins) {
        admins = _admins;
    }

    // allow an address to view customer data
    function allowViewer(uint256 _id, address _toAllow)
        external
        isOwnerOrAdmin(_id, msg.sender)
    {
        allowed[_id][_toAllow] = true;
    }

    // restrict caller to only admins
    modifier isAdmin() {
        bool IsAdmin;
        for (uint256 i = 0; i < admins.length; i++) {
            if (admins[i] == msg.sender) {
                IsAdmin = true;
            }
        }
        require(IsAdmin, "Not an admin");
        _;
    }

    modifier isOwnerOrAdmin(uint256 _id, address _admin) {
        bool IsCustomer = customersID[_id] == msg.sender;
        bool IsAdmin;
        for (uint256 i = 0; i < admins.length; i++) {
            if (admins[i] == _admin) {
                IsAdmin = true;
            }
        }
        require(IsCustomer || IsAdmin, "Not Customer or Admin");
        _;
    }
}
