//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;
contract mehann{
     uint  current=block.timestamp;
     uint cu;
     constructor(){
            cu=block.timestamp;
     }
     function mee()  public view returns(uint)
     {
         return current;
     }
       function meeeeee()  public view returns(uint)
     {
         return cu;
     }
}