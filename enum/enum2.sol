//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract array_opeerations{
    enum dele{pending,shipped,accepted,returnss}
    dele public a;
    function shipped() public{
        require(a == dele.pending);
        a=dele.shipped;
 }
    function acc() public{
        require(a== dele.shipped);
        a=dele.accepted;
    }
    function ret() public{
        require(a== dele.accepted);
        a=dele.returnss;
    }
}