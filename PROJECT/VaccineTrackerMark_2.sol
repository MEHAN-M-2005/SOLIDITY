//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract Seller
{   
    address owner;
    constructor()
    {
        owner = msg.sender;
    }
    modifier condition(address addr) 
    {
        require(addr==msg.sender,"not owner");
        _;
    }
    mapping(address => mapping(uint => vaccine[])) mapped;
    struct vaccine
    {
        string name;
        uint dosage;
        string disease;
        string expiry;
        uint temperature;
        string company;
        address user;
    }
    vaccine[] public vac;
    function AddDetails(string memory _name,uint _dosage ,
     string memory _disease, string memory _expiry , uint _temperature,
     string memory _company,uint index
    ) public 
    {
        vac.push(vaccine(_name,_dosage,_disease,_expiry,_temperature,_company,msg.sender));
        mapped[msg.sender][index].push(vaccine(_name,_dosage,_disease,_expiry,_temperature,_company,msg.sender));
        
    }
    
    function GetterFunc(address recepient,uint index) public view condition(recepient) returns(vaccine[] memory)
    {          require(recepient==owner,"not owner");
            return mapped[recepient][index];
    }

    function DelStruct( address addr,uint index) public condition(addr)
    {
        delete mapped[addr][index];
        delete vac[index];
    }

    
    
}
