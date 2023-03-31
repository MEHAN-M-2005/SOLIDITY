//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7; 
contract plain_ether_transfer{
        event rev(address sender, uint value,string msgg);
        event fall(address sender, uint value ,string msgg);
        receive() external payable{
        emit rev(msg.sender,msg.value,"transcation from receive");
        }
       
        fallback() external payable{
            emit fall(msg.sender,msg.value,"transcation from fallback");
        }
}