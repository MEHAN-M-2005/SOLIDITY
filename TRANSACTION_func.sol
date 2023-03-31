//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract trans{
    receive() external payable {}
    function tra(address _to)  external{
        payable(_to).transfer(address(this).balance);
    }
    function sen(address _to) external{
        bool res= payable(_to).send(address(this).balance);
        require(res, "FALSE");
    }
    function cal(address _to) external{
        (bool success,)=payable(_to).call{value: address(this).balance}("");
        require(success,"false");
    }
}
//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db-a
//0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB-b
