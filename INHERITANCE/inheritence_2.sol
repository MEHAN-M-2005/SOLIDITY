//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
import "./inheritence_1.sol";
contract second{
    first dos= new first();// it freshly redeploy the contract
    /* if ypu want to use the deployed contract:
    step1:remove new keyword
    step2: PASTE the address of the contract in first() in above senario*/
    function modify(uint _mod) public{
        dos.updateno(_mod);
    }

    function show() public view returns(uint){
        return dos.display();
    }
}