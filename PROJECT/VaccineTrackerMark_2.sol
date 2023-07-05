//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
//add vaccine details
//query it when required
contract Seller
{   
    address owner;
    address addrs;
    constructor()
    {
        owner = msg.sender;
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
        addrs = msg.sender;
    }
    
    function GetterFunc(address recepient,uint index) public view returns(vaccine[] memory)
    {          require(recepient==owner,"not owner");
            return mapped[recepient][index];
    }

    function DelStruct( address addr,uint index) public 
    {
        delete mapped[addr][index];
        delete vac[index];
    }

    
    
}