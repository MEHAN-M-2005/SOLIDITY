//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract Mehan{
    //ARRAY
    uint[] public  data;
    uint i=0;
    uint public l;
    function arr() public returns(uint){
    while(i<5){
        data.push(i);
        i++;
    }
    l=data.length;
    return l;
    }
}