//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract mehan{
    //MAPPING 
    mapping(uint => string) public bio_data;
    function mee(uint no, string memory name) public{
        bio_data[no]=name;
    } 
}