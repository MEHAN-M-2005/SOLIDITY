//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract called
{
    event data(address _add,uint amount);
    function get(string memory or) public payable returns(string memory )
    {
        emit data(msg.sender,msg.value);
        return(or);
    }

}
contract getted
{
    event hello(address fetter,bytes SON);
    function get_ether(address g_add) public payable
    {
            (bool success, bytes memory food)=payable(g_add).call{value:msg.value}(abi.encodeWithSignature("get(string)","helloTransaction"));
            require(success,"not successful");
    emit hello(g_add,food);
    }
}