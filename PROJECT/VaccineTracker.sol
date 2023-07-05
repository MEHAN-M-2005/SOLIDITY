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
    mapping(address => vaccine[]) mapped;
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
     string memory _company
    ) public 
    {
        vac.push(vaccine(_name,_dosage,_disease,_expiry,_temperature,_company,msg.sender));
        addrs = msg.sender;
    }
    
    function GetterFunc(address recepient) public view returns(vaccine[] memory)
    {       if(addrs != addrs)
            {
                revert("Address Not Found");
            }
            return mapped[recepient];
    }


    function EditName(uint index,string memory _name) public 
    {
        vac[index-1].name = _name;
    }
    function EditDosage(uint index,uint _dosage) public 
    {
        vac[index-1].dosage =_dosage;
    }
    function Editdisease(uint index,string memory _disease) public 
    {
        vac[index-1].disease = _disease;
    }
    function EditExpiry(uint index,string memory _Expiry) public 
    {
        vac[index-1].expiry = _Expiry;
    }
    function EditTemprature(uint index,uint _temperature) public {
        vac[index-1].temperature = _temperature;
    }
    function EditCompany(uint index,string memory _company) public {
        vac[index-1].company = _company;
    }

    
    
}