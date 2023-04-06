//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract victim
{
    uint a;
    uint amount;
    function seta(uint _a) public 
    {
        a=_a;
    }
    function geta()public view returns(uint x)
    {
        x=a;
    }
    //sending ether
    function getether(uint _am)public payable
    {
        amount=_am;
    }
    function disether() public view returns(uint)
    {
        return(amount);
    }

}
contract caller
{   
    function seta(address _addr,uint _a) public 
    {   //1
        victim(_addr).seta(_a);
        /*2 function(victim _addr,uint _a) public
            _addr.geta(_a);
        */
    }
    function geta(victim addr)public view returns(uint )
    {
        return addr.geta();
    }
    function getether(address _ad,uint _am)public payable
    {
            victim(_ad).getether{value:msg.value}(_am);
    }
    function disether(address addr)public view  returns(uint)
    {
        return victim(addr).disether();
    }
}