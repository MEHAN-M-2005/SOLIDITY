//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract Lottery
{
    address public manager;
    address payable[] public participants;
    address payable public winner;
    constructor()
    {
        manager=msg.sender;
    }
    function participate() payable public 
    {
        require(msg.value>=1 ether,"not sufficient funds");
        participants.push(payable(msg.sender));
    }
    function balance() public view returns(uint)
    {
        require(manager==msg.sender,"not owner");
        return address(this).balance;
    }
    function winnerFunction() internal view returns(uint)
    {
        return(uint(keccak256(abi.encodePacked(block.prevrandao,block.timestamp,participants.length))));
    }

    function pickWinner() public payable
    {
        require(manager==msg.sender,"not owner");
        require(participants.length>=3,"not required players");
        uint random=winnerFunction();
        uint Arr = random % participants.length;
        winner=participants[Arr];
        winner.transfer(balance());
        participants  = new address payable[](0); // to make the participants arraay zero
    }

    function WinnerBalance() public  view returns(uint)
    {
        return winner.balance;
    }


}
