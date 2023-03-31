//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;
contract time_lock{
    uint immutable current;
    uint immutable duraction;
    uint immutable total;
    address owner;
    constructor()
    {       
        owner=msg.sender;
        current=block.timestamp;
        duraction= 1 minutes ;
        total=current+duraction;
    }
    modifier condition() {
        require(block.timestamp >= total,"wait until the time over");
        _;
    }
    event get(address,uint);
    receive() external payable virtual condition{
             
            emit get(msg.sender,msg.value);        
    }
    function send(address payable _receiver,uint _amount) public condition virtual  {
            require(owner==msg.sender,"not owner");
            require(_amount>=1,"not sufficient balance");
            _receiver.transfer(_amount);
    }
    function balance() public view virtual  returns(uint) {
        return(address(this).balance); 

    }

}
contract second is time_lock{
    event get(uint);
    receive() external payable override {
        emit get(msg.value);
    }
    function balance() public view override returns(uint)
    {
        return(address(this).balance);
    }

}