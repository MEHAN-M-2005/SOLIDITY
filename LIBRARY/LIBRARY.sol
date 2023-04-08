// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
//LIBRARY US ACT AS FUNCTION FOR CONTRACTS, REDUCE CODE REUSEABILITY
library lib_name
{
    function get(uint x,uint y) internal pure returns(string memory )
    {
        if(x>y)
        {
            return "first value is greater";
        }
        else
        {
            return "second value  is greater";
        }
    }
}
contract value_provider
{
    function value(uint a,uint b) public pure returns(string memory)
    {
        return lib_name.get(a,b);

    }
}