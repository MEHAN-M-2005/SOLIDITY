//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract mehan{
    address public owner;
    uint public a;
    constructor(uint _x){
        a=_x;
        owner=msg.sender;
        _x = a; // find why a value is 0 instead of the given input.

    }
}
