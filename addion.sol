//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract mehan{
    uint a;
    uint b;
    uint public c;
    function mee(uint _a,uint _b) public{
        a=_a;
        b=_b;
        c=a+b;
    }
}