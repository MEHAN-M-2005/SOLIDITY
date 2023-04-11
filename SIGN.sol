//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract sign 
{
    function getter(string memory _msg) public pure returns(bytes32)
    {
        return keccak256(abi.encodePacked(_msg));
    }
    function get_sign(bytes32 _hash) public pure returns(bytes32)
    {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message\n32",_hash));
    }
    function verify(address _addr,string memory _val,bytes memory _signature) public pure returns(bool)
    {
        bytes32 getter_hash=getter(_val);
        bytes32 get_signed=get_sign(getter_hash);
        return addr_getter(get_signed,_signature)==_addr;
    }
    function addr_getter(bytes32 get_signs,bytes memory _signature) public pure returns(address) 
    {
        (bytes32 a,bytes32 b, uint8 c)=split_sig(_signature);
        return ecrecover(get_signs,c,a,b);
    }
    function split_sig(bytes memory _signature) public pure returns(bytes32 a,bytes32 b,uint8 c)
    { require(_signature.length==65,"not valid");
        assembly
        {
                a:=mload(add(_signature,32))
                b:=mload(add(_signature,64))
                c:=byte(0,mload(add(_signature,96)))
        }
    }
}