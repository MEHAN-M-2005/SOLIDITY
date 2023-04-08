// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Callee {
    constructor(address _owner) 
    {
        owner=_owner;
        ba=msg.sender;
    }
    address public owner;
    address public ba;
 
}
contract neww
{   Callee[] public getter;
    function ree(address get) external
    {
        Callee callee =new Callee(get) ;
        getter.push(callee);
    }
} 