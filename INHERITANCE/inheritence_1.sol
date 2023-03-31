//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract first{
    uint  num;
    function updateno(uint _num) public{
        num=_num;
    }
    function display() public  view returns(uint) {
        return num;
    }
}

