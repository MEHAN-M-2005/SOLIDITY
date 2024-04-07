//SPDX-License-Identifier:MIT
//Fund
//withraw
pragma solidity ^0.8.18;
import {Script,console} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";
contract Interactions is Script
{
    uint256 constant SEND_VALUE  = 0.1 ether; 
    function funcFundMe(address mostRecentAddr) public
    {
        vm.startBroadcast();
         FundMe(payable(mostRecentAddr)).fund{value:SEND_VALUE}();
         vm.stopBroadcast();
                  console.log("Fundedn FundMe With %s",SEND_VALUE);

    }
    function run() external 
    {

            address mostRecentAddress  =  DevOpsTools.get_most_recent_deployment(
                "FundMe",
                block.chainid
            );
        vm.startBroadcast();
        funcFundMe(mostRecentAddress); 
        vm.stopBroadcast();

    }
}
contract withDrawFundMe is Script
{
  uint256 constant SEND_VALUE  = 0.01 ether; 
    function withDrawFundMeFunc(address mostRecentAddr) public
    {
        vm.startBroadcast();
         FundMe(payable(mostRecentAddr)).withdraw();
         vm.stopBroadcast();
    }
    function run() external 
    {

            address mostRecentAddress  =  DevOpsTools.get_most_recent_deployment(
                "FundMe",
                block.chainid
            );
        vm.startBroadcast();
        withDrawFundMe(mostRecentAddress); 
        vm.stopBroadcast();

    }
}
