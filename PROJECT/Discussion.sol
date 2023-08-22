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
    //uint PostCount;
    //address[ ] public membersc;
    mapping(address=>bool) public mapped;
 //   mapping(address=>string) public mapped2;
    constructor()
    {
        owner=msg.sender;
        mapped[msg.sender]=true;
    }
    error unauthorised(address addrs);
    modifier condition() 
    {
        if(!mapped[msg.sender])
        {
            revert unauthorised({addrs:msg.sender});
        }
        _;
    }
    struct Posted
    {
        uint post_no;
        address author;
        string message;
        uint posttime;
    }
    mapping(address=>Posted) public mapped2;
    struct Commented
    {
        uint comment_no;
        address author;
        string commentMessage;
        uint commenttime;
    }
    mapping(address=>mapping(address=>Commented)) public mapped3;
    Posted public post;
    Commented public comment;
    function addMembers(address addr) public condition 
    {
        mapped[addr]=true;
    }
    function remove(address addr) public 
    {
        require(owner==msg.sender,"not owner");
        mapped[addr]=false;
    }
    function createPost(address addr,string memory str) public  condition returns(address)
    {
     //   mapped2[addr]=str;
      //  PostCount++;
       // membersc.push(addr);
       Posted storage posvalue = mapped2[addr];
       posvalue.post_no = posvalue.post_no +1 ;
       posvalue.author= addr;
       posvalue.message = str;
       posvalue.posttime = block.timestamp;
       return addr;

    }
    function createComment(address addr, string memory str) public condition
    {
        address tempaddr  = createPost(addr,str); 
        Commented storage comvalue = mapped3[tempaddr][addr];
        comvalue.comment_no = comvalue.comment_no +1 ;
        comvalue.author = addr;
        comvalue.commentMessage = str;
        comvalue.commenttime=block.timestamp;
    }
    function deleteval()

   
}
