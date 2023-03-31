//SPDX-License-Identifier:MIT
//THIS PROGRAM SEND ETHER  FROM ONE SMART CONTRACT TO ANOTHER SMART CONTRACT
pragma solidity 0.8.17;
contract send_ether{    
   
    address owner_contract;
    string  internal res;
    event wit(uint value);
    event dep(uint value);
    //uint amount;
    
    receive() external payable{
        emit dep(msg.value);
    }
    constructor() payable
    {
        owner_contract=msg.sender;
       
    }
  
    function Piggywith(uint amount) public
    {
      require(owner_contract==msg.sender,"not owner");
      emit wit(amount);
        selfdestruct(payable(msg.sender));
    }
    function sendd(address payable _add,uint amount) external payable
    {
        require(address(this).balance >= 1,"no balance");
        require(msg.sender==owner_contract,"not owner");
        _add.transfer(amount);
       
    }  
    function balance() public view returns(uint)
    {
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
    function bal() external view returns(uint){
        return(address(this).balance);
    }
   
}