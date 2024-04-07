// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "../script/HelperConfig.sol";
contract DeployFundMe is Script {
    FundMe fundMe;
    address public addr;
    function setUp() public {}

    function run() public returns(FundMe,HelperConfig){
        HelperConfig configFundMe = new HelperConfig();
          addr = configFundMe.configFinal();
        vm.startBroadcast();
         fundMe = new FundMe(addr) ;
        vm.stopBroadcast();
        return (fundMe,configFundMe);

    }
}
