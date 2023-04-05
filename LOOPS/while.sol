//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract Mehan{
  uint a=1;
  uint public b=0;
  function loop() public returns(uint){
      while(a==1){
        b++;
    
      }
      return b;
  }

}