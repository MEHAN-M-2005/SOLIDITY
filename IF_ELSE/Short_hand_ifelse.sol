//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;
contract mehan
{   string public b="mehan";
    string public c="mehan1";
    uint public a=1;
    function ifelse() public view returns(string memory)
    {
     return a==0 ? b : c;
    }

}