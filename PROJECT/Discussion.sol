//SPDX-License-Identifier:MIT
/* 
1.create post
2.comment post
3.allow only authorised users
4.continously store the data in smart contract
*/
pragma solidity 0.8.19;
contract Discussion
{
    
    address owner;
    address[] members;
    constructor()
    {
        owner = msg.sender;
    }
    modifier condition()
    {
        require(owner==msg.sender,"not owner");
        _;
    }
    modifier condition2()
    {
         for(uint iteration=0;iteration<=members.length;iteration++)
        {
            if(msg.sender != members[iteration])
            {
                revert("not a member");
            }
        }
        _;
    }
    mapping (address=>string) mapped;
    mapping (address =>mapping(string=>string)) comment2;
    function addMembers(address addr) public  condition
    {
        members.push(addr);
    }
    function CreatePost(string memory data) public  condition2
    {
       
        mapped[msg.sender] =  data;
    }
    function Comment(string memory data_1) public condition2
    {
        mapped[msg.sender][data_1] = 
    }






    
}

