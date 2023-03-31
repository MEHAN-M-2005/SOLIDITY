//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;
contract mehan
{   string public b;
    uint public a=1;
    function ifelse() public returns(string memory)
    {
    if(a==0)
    {
        b="mehan";
         return b;
    }
    else if(a==1)
    {
        b="hhhh";
        return b;
    }
    else
    {
        b="mehan123445";
        return b;
    }
   
    }

}