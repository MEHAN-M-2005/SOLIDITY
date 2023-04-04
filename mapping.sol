//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract mehan{
    //MAPPING 
    mapping(uint => string) public bio_data;
    function mee(uint no, string memory name) public{
        bio_data[no]=name;
    } 
}
contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}
