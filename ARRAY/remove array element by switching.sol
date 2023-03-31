//SPDX-License-Identifier:MIT
pragma solidity 0.8.7;
contract array{
    uint[]  arr=[1,2,3,4,5,6]; //LET'S REMOVE 2 FROM THIS ARRAY
    //IF WE USE delete arr[1] the answer will be arr=[1,0,3,4,5,6] so...
    function remove(uint index) public  {
        require(index<arr.length,"out of index");
    for(uint i=index;i< arr.length;i++){
        arr[i]=arr[i+1];
    }
    arr.pop();   
    }
}