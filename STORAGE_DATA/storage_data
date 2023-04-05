//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;
contract storage_data {
    struct Struct{
      string name;
      uint age;
    }
    mapping(address => Struct) get;
    function foot( ) public returns(Struct memory)
    {
      //use storage to store dynamic data tha store in blockchain 
        get[msg.sender]=Struct({name:"mehan",age:17});
        Struct storage change=get[msg.sender];
        change.name="megasri";
      //use memory to read and store data tha cannot store in blokchain, Temporary store in the function
        Struct memory read=get[msg.sender];
        return read;
    }
    //use calldata to get function parameters instead of memory to reduce gas
function call(uint[] calldata arr) public pure returns(uint[] memory)
{
    return arr;
}
 }
