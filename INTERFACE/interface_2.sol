//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
interface Icountt
{
     function increment() external  returns(uint);
}
contract accesser
{
    uint public  counter=0;
    function incrementer(address addr) external 
    {
        counter =  Icountt(addr).increment();
     
    }
}