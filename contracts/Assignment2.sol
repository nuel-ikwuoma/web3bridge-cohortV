// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Ass2 {
    function hash1(string memory _s1, string memory _s2) internal pure returns(bytes32) {
        return keccak256(abi.encode(_s1, _s2));
    }
    
    function hash2(string memory _s1, string memory _s2) internal pure returns(bytes32) {
        return keccak256(abi.encode(_s1, _s2));
    }
    
    function output(
        string memory _arg1,
        string memory _arg2,
        string memory _arg3,
        string memory _arg4
        ) public pure returns(bytes32, bytes32) {
        return (hash1(_arg1, _arg2), hash2(_arg3, _arg4));
    }
}
