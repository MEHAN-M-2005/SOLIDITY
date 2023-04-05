//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract name{
    uint a=0;
    uint public b=0;
    function dowhile() public returns(uint){
        do{
        b++;
        if(b==5){
          break;
        }
      }while(a==0);
      return b;
    }
  
}