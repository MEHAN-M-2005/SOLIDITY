//SPDX-License-Identifier:MIT
pragma solidity 0.8.7;
contract FUNCTIONS {
 uint [ ] public a=[1,2,3,4,5];
  function mee() public view returns(uint[] memory)
  {
      return a;
  } 



  function returnm(uint _a,bool b,string memory c) public pure returns(uint,bool,string memory )
  {
        return(_a,b,c);
  }




  function mee() public pure returns(uint a,bool b, string memory c )
  {
        a=1;
        b=true;
        c="mehan";
  }


function return_arr() public reutrns(uint[] memory)
{
return arr;
}
  }