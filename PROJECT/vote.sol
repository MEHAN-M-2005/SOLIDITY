// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Voting {
    struct Candidate {
        string name;
        uint id;
        uint voteCount;
    }
    Candidate public candidateStruct;
    event Log(address indexed addr,bool indexed result);
    mapping(address => Candidate) public mapCandidates;
    mapping(address => bool) public validCandidate;
    uint public candidateCount;
    uint i=0;
    mapping(string=>uint256) public mapped_3;
    mapping (address=>string) public mapped_4;

    constructor() {
       candidateCount=0;
    } 
    function makefalse(address addr)  public  {
        validCandidate[addr]=false;
    }
    function name() public view  returns(string memory)
    {
        return candidateStruct.name;
    }
    function addressReturn() public view returns(address)
    {
        return msg.sender;
    }
    function id() public view returns(uint256)
    {
        return  candidateStruct.id;
    }
   
  
   
    function getMappedValue(string memory key) public view  returns(uint256)
    {
        return mapped_3[key];
    }
     function addCandidate(string memory candidateNames,address candiaddr) public  {
         require(!validCandidate[candiaddr],"already voted");
            candidateCount++;
            mapped_3[candidateNames]=candidateCount;
            mapCandidates[candiaddr] = Candidate(candidateNames, candidateCount, 0);
            mapped_4[candiaddr]=candidateNames;
            validCandidate[candiaddr]=true;
        
        emit Log(msg.sender,true);
      
    }
    function vote( address candiAddr) public 
    {
       
        require(!validCandidate[candiAddr],"already voted");
        validCandidate[candiAddr]=true;
        mapCandidates[candiAddr].voteCount++; 
        emit Log(msg.sender,true);
    }

    function getvotecount(address candiAddr) public  returns(uint)
    {
        // require(_candidateid>0 && _candidateid<=candidateCount,"condition not met" );
        emit Log(candiAddr,true);
        return mapCandidates[candiAddr].voteCount;
     
    }
}
