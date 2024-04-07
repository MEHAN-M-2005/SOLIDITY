//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
import {MockV3Aggregator} from "../test/mocks/Mockv3.sol";
import {Script} from "forge-std/Script.sol";
contract HelperConfig is Script{
    NetworkChooser public configFinal;
    uint8 public constant DECIMAL = 8;
    int256 public constant INITIAL_PRICE = 200e8;
    constructor()
    {
        if(block.chainid==11155111) 
        {
            configFinal = sepoliaNetwork();
        }
        else if(block.chainid==1) configFinal = EthMainnet();
        else configFinal = anvilTest();
    }
    struct NetworkChooser{
        address addr_network;
    }
    function sepoliaNetwork() public pure returns(NetworkChooser memory)
    {
        NetworkChooser memory testNetwork = NetworkChooser({addr_network:0x694AA1769357215DE4FAC081bf1f309aDC325306});
        return testNetwork; 
    }
    function EthMainnet() public pure returns(NetworkChooser memory)
    {
        NetworkChooser memory testNetwork = NetworkChooser({addr_network: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419});
        return testNetwork;
    }
    function anvilTest() public  returns(NetworkChooser memory)
    {
        vm.startBroadcast();
        MockV3Aggregator mockpriceFeed = new MockV3Aggregator(DECIMAL,INITIAL_PRICE);
        vm.stopBroadcast();
        NetworkChooser memory anvilConfig = NetworkChooser({addr_network:address(mockpriceFeed)});
        return anvilConfig;
    }
}