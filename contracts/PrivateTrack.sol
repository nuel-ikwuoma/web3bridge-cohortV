// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract Private {
    mapping(address => uint) callCount;
    mapping(address => bytes4) lastCalledFunction;
    
    
    function stub1() public returns(bool) {
        bytes4 sig = bytes4(keccak256("stub1()"));
        callCount[msg.sender] += 1;
        lastCalledFunction[msg.sender] = sig;
        return true;
    }
    
    function stub2() public returns(bool) {
        bytes4 sig = bytes4(keccak256("stub2()"));
        callCount[msg.sender] += 1;
        lastCalledFunction[msg.sender] = sig;
        return true;
    }
    
    function stub3() public returns(bool) {
        bytes4 sig = bytes4(keccak256("stub3()"));
        callCount[msg.sender] += 1;
        lastCalledFunction[msg.sender] = sig;
        return true;
    }
    
}
