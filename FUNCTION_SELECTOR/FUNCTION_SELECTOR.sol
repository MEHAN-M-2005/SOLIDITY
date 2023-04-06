//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract func_selector
{
    function select(string calldata _string) public pure returns(bytes4)
    {
        return(bytes4(keccak256(bytes(_string))));
    }

}
contract proof
{   event log(bytes dat);
    function get(address _add,uint _amount) public
    {
        emit log(msg.data);
    }
    //0xb464631b
    //0000000000000000000000008059b0ae35c113137694ba15b2c3585ae77bb8e9
    //000000000000000000000000000000000000000000000000000000000000000c
}

/*FUNCTION SELECTOR TOPIC IS USED TO SEE HOW SOLIDITY COMPILER ENCODE A PARTICULAR FUNCTION 
IN THE ABOVE BYTES(//) FIRST LINE IS TO CALL THE FUNCTION, AND SECOND LINE IS FIRST PARAMETER,
THIRD LINE IS SECOND PARAMETER*/ 