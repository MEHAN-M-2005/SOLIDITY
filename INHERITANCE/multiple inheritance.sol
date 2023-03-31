//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract A{
    function con() public pure virtual returns(string memory)
    {
        return "A";
    }
    function con1() public pure virtual returns(string memory)
    {
        return "A";
    }
    function con2() public pure virtual returns(string memory)
    {
        return "A";
    }
}
contract B is A{
    function con() public pure override  returns(string memory)
    {
        return "B";
    }
     function con1() public pure override virtual returns(string memory)
    {
        return "B";
    }

}
contract C is B{
    function con1() public pure override returns(string memory)
    {
        return  "C";
    }
     function con2() public pure override returns(string memory)
    {
        return  "C";
    }

}