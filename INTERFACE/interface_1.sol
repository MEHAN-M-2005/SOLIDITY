//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract countt
{   uint public count;
    function increment() external  returns(uint)
    {
        count+=1;
        return count;
    }
}