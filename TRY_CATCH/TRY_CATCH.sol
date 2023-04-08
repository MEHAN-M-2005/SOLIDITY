// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
/* TRY AND CATCH USED A IF_ELSE FOR A FUNCTION*/
contract owner
{
    function getter(uint _i) public pure returns(uint)
    {
        require(_i>=1,"less than zero");
        return _i;
    }
}
contract caller
{ event log(string  word);
    owner OO=new owner();
    function give(uint _i) public 
    {   
        try OO.getter(_i) 
        {
            emit log ("good job");
        }
        catch
        {
            emit log("bad job");
        }
    }
   

}