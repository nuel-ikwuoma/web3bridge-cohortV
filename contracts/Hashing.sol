// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract Hashing {
    
    function hash1 (address _a, address _b, address _c) public pure returns(bytes32) {
        bytes32 firstHash = keccak256(abi.encode(_a, _b));
        bytes32 h1 = keccak256(abi.encode(firstHash, _c));
        return h1;
    }
    
    function _hashFinal(
        bytes32 _hash1,
        uint _num,
        bytes32 _val
    ) public pure returns(bytes32) {
        bytes32 numHash = keccak256(abi.encode(bytes32(_num)));
        bytes32 valHash = keccak256(abi.encode(bytes32(uint256(_val))));
        bytes32 finalHash = keccak256(abi.encode(_hash1, numHash, valHash));
        return finalHash;
    }
}
