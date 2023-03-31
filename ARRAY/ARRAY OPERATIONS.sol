//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract Mehan{
    uint[] public data=[1,2,3,4,5,6,7,8];
    //uint public len;
    uint public  getelements;
    function add(uint a) public {
        data.push(a);
    }
    function getelement(uint b) public{
        getelements= data[b];
    }

    function popfunc() public { //used to delete last element.
        data.pop();
    }
    function delete_element(uint d) public { //it can't works
        delete data[d];
    }
    function length_element() public view returns(uint) {
        return data.length;
    }
}