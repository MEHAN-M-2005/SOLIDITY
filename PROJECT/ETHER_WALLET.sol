//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;
contract send_ether{
    uint immutable current;
    uint immutable duraction;
    uint immutable total;
    event deposit(address,uint);
    event withdraw(address,uint);
    address owner_contract;
    enum results{
        amount_deposited,
        amount_successfully_withdrawl,
        amount_sent
    }
    results internal result;
    //uint amount;
    receive() external payable
    {
        emit deposit(msg.sender,msg.value);
        result=results.amount_deposited;
    }
    constructor() payable 
    {
        owner_contract=msg.sender;
        current=block.timestamp;
        duraction= 1 minutes;
        total= current+duraction;
    }
    modifier condition()
    {
        require(block.timestamp > total,"wait until the time over");
        _;
    }
    function withraw(address _address, uint _amount) public 
    {
        emit withdraw(_address,_amount);
        result=results.amount_successfully_withdrawl;

    }
    function sendd(address payable _add,uint amount) external payable condition
    {
        require(address(this).balance >= 1,"no balance");
        require(msg.sender==owner_contract,"not owner");
        _add.transfer(amount);
        result=results.amount_sent;
       
    }  
    function balance() external view returns(uint){
        return(address(this).balance);
    }
}
contract receive_ether{
    address owner_contract;
   // uint amount;
    receive() external payable{}
    constructor() payable {
        owner_contract=msg.sender;
    }
    function sendd(address payable _add,uint amount) external payable{
        require(address(this).balance >= 1,"no balance");
        require(msg.sender==owner_contract,"not owner");
        _add.transfer(amount);
    }
    function balance() external view returns(uint){
        return(address(this).balance);
    }
    
}