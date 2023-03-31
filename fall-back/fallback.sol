//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract FALL_Back{
    mapping(address => uint) mm;
    
    
     fallback() external payable  {
         mm[msg.sender] += msg.value;
     }

    function mee() public  view returns(uint){
        return address(this).balance;
    }
     
}