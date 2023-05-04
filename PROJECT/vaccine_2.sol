//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract vaccines
{   
   
  // uint public price = fees.fee();
    bytes32 ordered= keccak256(bytes("ordered"));
    bytes32 Shipped = keccak256(bytes("shipped"));
    bytes32 Out_for_Delivery = keccak256(bytes("Out for delivery"));
    bytes32 Delivered = keccak256(bytes("delivered"));
    uint immutable current;
    uint immutable want ;
    uint immutable finall ;
    address owner;
    address customer;
    uint received;
    address login;
    event tranc(address indexed addr,uint indexed value);
    
    constructor(address customerAddress) 
    {   
        current = block.timestamp;
        want= 1 minutes;
        finall = want+current;
        owner=msg.sender;
        login=customerAddress;
        
    }
    modifier time()
    {
        require(block.timestamp>finall,"wait");
        require(tx.origin==login,"Send eth from yout address");
        _;
    }
    modifier amount()
    {   //require(login==customer,"MAKE TRANSACTION WITH YOUR ADRESS");
        require( address(this).balance == 3 ether ,"pay required amount");
        require(tx.origin==login,"Send eth from yout address");

       // owner=msg.sender;
        _;
    }
    //TO RECEIVE ETH
    receive() external payable
    {
       
       emit tranc(tx.origin,msg.value);
    }
     
    //TO DET DATA
    struct Vaccine
    {
        string name;
        string disease;
        uint temperature;
        string expiry_date;
        uint quantity;
        uint dosage_ml;
    }
    Vaccine[] public Vaccinedata;
    enum Status
    {
        Ordered,
        Shipped,
        Out_for_Delivery,
        Delivered
    }
    Status  status;
    uint numberOfVaccines;
    function setdata(
        string memory _name,
        string memory _disease,
        uint _temperature,
        string memory  _expiry_date,
        uint _quantity,
        uint _dosage_ml
         ) public amount
         {
             Vaccinedata.push(Vaccine({name:_name,disease:_disease,temperature:_temperature,expiry_date:_expiry_date
            ,quantity:_quantity,dosage_ml:_dosage_ml}));  
            numberOfVaccines+=1;
         }
    // TO GET DATA
    /*function getdata(uint index) public view returns(Vaccine memory)
    {
        return data[index];
    }
    */
    //TO UPDATE DATA
    function updateName(uint index,string memory Name) public
    {
         Vaccinedata[index-1].name=Name;
    }
     function updatedisease(uint index,string memory Disease) public
    {
         Vaccinedata[index-1].disease=Disease;
    }
     function updateTemperature(uint index,uint Temperature) public
    {
         Vaccinedata[index-1].temperature=Temperature;
    }
     function updateExpirtDate(uint index,string memory Expiry_date) public
    {
         Vaccinedata[index-1].expiry_date=Expiry_date;
    }
     function updateQuantity(uint index,uint Quantity) public
    {
         Vaccinedata[index-1].quantity=Quantity;
    }
     function updateDosageMl(uint index,uint Dosage_ml) public
    {
         Vaccinedata[index-1].dosage_ml=Dosage_ml;
    }
     function statuss(string memory  state) public time
    {   //require(state!=);
        if(keccak256(bytes(state))==ordered)
        {
            status = Status.Ordered;
        }
        else if(keccak256(bytes(state))==Shipped)
        {
            status =  Status.Shipped;
        }
        else if(keccak256(bytes(state))==Out_for_Delivery)
        {
            status  = Status.Out_for_Delivery;
        }
        else if(keccak256(bytes(state))==Delivered)
        {
            status  = Status.Delivered;
        }
    }
    function getterr() public view  returns(Status)
    {
        return status;
    }
}

/*______________________________________________________________________________________________________________*/
contract customerr {
    address login;
    uint  fee;
    receive() external payable {}
    constructor()
    {
        login=msg.sender;
    }
    address  owner;
    modifier validAddress(address _addr) {
        require(_addr==login, "Not valid address");
        _;
    }
    function changeOwner(address _newOwner,address winner,uint amount) public  validAddress(_newOwner) {
        owner = _newOwner;
        fee=amount;
        require(amount==3 ether,"not sufficient funds");
        payable(winner).transfer(amount);
    }
    function returnAmount() public view returns(uint)
    {
        return fee;
    }

    function balance()public view  returns(uint)
    {
        return address(this).balance;
    }
    }

