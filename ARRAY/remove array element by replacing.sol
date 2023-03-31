//SPDX-License-Identifier:MIT
pragma solidity 0.8.7;
contract replace{
    uint[] public arr=[1,2,3,4];
    function rem(uint _index) public {
        arr[_index]=arr[arr.length-1]; //arr=[1,4,3]
    }
    function ree() public view returns(uint){
        for(uint i=0;i<=arr.length;i++){
            return(arr[i]);
        }
    }
}