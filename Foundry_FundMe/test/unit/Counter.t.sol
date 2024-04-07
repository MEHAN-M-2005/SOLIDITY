//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
import {Test,console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import{DeployFundMe} from "../../script/Counter.s.sol";
import {HelperConfig} from "../../script/HelperConfig.sol";
contract Testing is Test{
  FundMe public fundMe;
HelperConfig public helperConfig;

uint256 public constant SEND_VALUE = 0.1 ether;
uint256 public STARTING_ETHER = 10 ether;
uint256 public constant GAS_PRICE =1;
address public constant USER = address(1);
    function setUp() external  
    {
        
        DeployFundMe deployFundMe = new DeployFundMe();
        (fundMe,helperConfig) = deployFundMe.run();
        vm.deal(USER,STARTING_ETHER);
    }
    function testMinimumDollarIsFive() public view
    {
        assertEq(fundMe.MINIMUM_USD(),5e18);
    }
    function testOwnerIsMsgSender() public view
    {
        assertEq(fundMe.getOwner(),msg.sender);

    }
    function testPriceFeedVersionIsAccurate() public view 
    {
     
        uint256 val = fundMe.getVersion();
        assertEq(4,val);
    }
    function testFundFailsWithoutEnoughETH() public {
        vm.expectRevert();
        fundMe.fund();
    }
    function testFundUpdatesFundedDataStructure() public{
        vm.prank(USER);
        fundMe.fund{value:SEND_VALUE}();
        uint256 amountFunded = fundMe.getAddressToAmountFunded(USER);
        assertEq(amountFunded,SEND_VALUE);
    }
    function testAddsFundsToArrayOfFunders() public
    {
        vm.prank(USER);
        fundMe.fund{value:SEND_VALUE}();
        address funder = fundMe.getFunder(0);
        assertEq(funder,USER);
    }
    modifier funded()
    {
        vm.prank(USER);
        fundMe.fund{value:SEND_VALUE}();
        _;
    }
    function testOnlyOwnerCanWithdraw() public funded
    {
        vm.expectRevert(); 
        vm.prank(USER);
        fundMe.withdraw();
    }
     function testWithDrawSinglefunder() public funded
     {
            uint256 startingOwnerBalance = fundMe.getOwner().balance;
            uint256 startingFundMeBalance = address(fundMe).balance;
         
            vm.prank(fundMe.getOwner());
            fundMe.withdraw();

          
            uint256 endingOwnerBalance = fundMe.getOwner().balance;
            uint256 endingFundMeBalance = address(fundMe).balance;

            assertEq(endingFundMeBalance,0);
            assertEq(startingFundMeBalance+startingOwnerBalance,endingOwnerBalance);
     }

     function testWithDrawFromMultipleFunders() public funded
     {
      
        uint160 numberOfFunders = 10;
        uint160 startingFundersIndex = 0;
        for(uint160 i=startingFundersIndex;i<numberOfFunders;i++)
        {
           hoax(address(i),SEND_VALUE); 
           fundMe.fund{value:SEND_VALUE}();
        }
        uint256 startingOwnerBalance = fundMe.getOwner().balance;
        uint256 startingFundMeBalance = address(fundMe).balance;
        vm.startPrank(fundMe.getOwner());
        fundMe.withdraw();
        vm.stopPrank();


        assert(address(fundMe).balance==0);
        assert(startingFundMeBalance+startingOwnerBalance==fundMe.getOwner().balance);

     }
}