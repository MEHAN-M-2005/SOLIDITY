//SPDX-License-Identifier:MIT
//Fund
//withraw
pragma solidity ^0.8.18;
import {HelperConfig} from "../../script/HelperConfig.sol";
import {FundMe} from "../../src/FundMe.sol";
import {Script,console} from "forge-std/Script.sol";
import {Interactions ,withDrawFundMe} from "../../script/interactions.s.sol";
import {DevOpsTools} from "../../lib/foundry-devops/src/DevOpsTools.sol";
import {DeployFundMe} from "../../script/Counter.s.sol";
contract InteractionsTest is Script
{
      FundMe fundMe ;
  HelperConfig helperConfig;
    uint256 constant GAS_PRICE = 1; 
    address USER = makeAddr("user1");
    uint256 constant SEND_VALUE = 0.1 ether;
    uint256 constant STARTING_ETHER= 10 ether;
    function setUp() external
    {
        DeployFundMe deploy = new DeployFundMe();
          (fundMe ,helperConfig)= deploy.run();
        vm.deal(USER,STARTING_ETHER);

    }
    function testUserCanFundInteractions() public {
        Interactions fundFundMe = new Interactions();
        fundFundMe.funcFundMe(address(fundMe));
      
        withDrawFundMe  withdrawfundMevar = new withDrawFundMe();
        withdrawfundMevar.withDrawFundMeFunc(address(fundMe));

        assert(address(fundMe).balance==0);

    }
    
}

