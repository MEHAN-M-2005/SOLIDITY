//SPDX-License-Identifier:MIT
//1)create poll functon
//2) able to enter choice in poll
//3)set voting period at end one would be winner
//4)
pragma solidity 0.8.20;
contract Polling
{   
    uint immutable current;
    uint immutable time;
    uint total;
    uint public YesCount;
    uint public NoCount;
    address[]  YesArr;
    address[]  NoArr;   
    address[] players;
    mapping(address=>bool) getDuplicate;
    
    constructor() 
    {
        current = block.timestamp;
        time  = 2 minutes;
        total  = current + time;
    }
    mapping (address=>string) mapped;
    address payable[] participants;
    function Question() public  pure returns(string memory)
    {
        return("WHETHER MEHAN ATTAIN FINANCIAL FREEDOM AFTER 25");
    }

    function getAddressChoice(string memory _input)  public view  returns(address [] memory) 
    {
        if(keccak256(abi.encodePacked("yes"))== keccak256(abi.encodePacked(_input)) || keccak256(abi.encodePacked("YES"))== keccak256(abi.encodePacked(_input)))
        {
            return YesArr;
        }
        else if(keccak256(abi.encodePacked("no")) == keccak256(abi.encodePacked(_input)) || keccak256(abi.encodePacked("NO")) == keccak256(abi.encodePacked(_input)))
        {
            return NoArr;
        }
        
    }
    modifier condition(address addrs) 
    {   
        _;
    }  
    function Yes(address addr) public condition(addr)
    {
        YesArr.push(addr);
        players.push(addr);
        getDuplicate[addr]=true;
         require(!getDuplicate[addr],"Already voted");
        YesCount++;

    }
    function No(address addr) public condition(addr)
    {
        NoArr.push(addr);
         players.push(addr);
         getDuplicate[addr] = true;
        require(!getDuplicate[addr],"Already voted");
         
        NoCount++;
    }

}