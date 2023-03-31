//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract Modifier{
    // modifiers are used to reduce code reusw inside functions
    //it changes the behaviour of function
    address owner;
    modifier check_owner(){
        require(msg.sender==owner);
        _;
    }
    constructor(){
         owner=msg.sender;

    }
    function new_owner(address newowner) public check_owner {
            owner=newowner;

    } 
}