//SPDX-License-Identifier:MIT
pragma solidity 0.8.7;
contract NestedMapping {
    //USING STRUCT STORING MULTIPLE VALUES IN DIFFERENT DATA TYPES IN AN SINGLE INDEX OF AN ARRAY
    struct bio_data{
        string name;
        uint age;
    }
    bio_data[] public bio;
    bio_data[] public bio1;
    function me(string memory _name, uint _age) public{
        bio.push(bio_data(_name,_age));
    } 
    function mee(string memory _namee,uint _agee) public 
    {
        bio1.push(bio_data(_namee,_agee));
      
    }
    function foo() public  view returns(bio_data[] memory)
    {
        return bio1;
    }
}
