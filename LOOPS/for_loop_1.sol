//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;
contract mehan
{   uint public a=0;
function for_while() public returns(uint)
{

    for(uint i=0;i<10;i++)
    {
        a+=1;
        if(i==5)
        {
            continue;
        }
        if(i==7)
        {
            break;
        }
    }
    return a;
}
}