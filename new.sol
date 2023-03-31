//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract first{
    uint num;
    function updateno(uint _num) public{
        num=_num;
    }
    function display() public view returns(uint){
        return num;
    }
}

contract second{
    /* To inport the first contract in second use its name as datatype and give a name to 
    access it (it's like variable creation) and new name of first contract ();

    SYNTAX:
    name of first_contract var_name = new name of first_contract ();
    
    TO ACCESS A FUNCTION FROM NEIGHBOUR CONTRACT:
         SYNTAX:
            var_name.function_name in neighbour contract(parameter);
    */
     first genesis = new first();
     function change_no(uint _change) public{
         genesis.updateno(_change);
     }
     function print() public view returns(uint){
         return genesis.display();
     }
}