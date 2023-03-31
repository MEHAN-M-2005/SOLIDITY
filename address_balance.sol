//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;
contract mehan{
    address public owner;
    constructor(){
    owner=msg.sender;
    }
    function balance() public view returns(uint){
        return(address(this).balance);
        //return(owner.balance);
    }

}