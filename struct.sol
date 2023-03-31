//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
contract Mehan{
    struct bio{
        string  name;
        uint age;
        string gender;
    }
      bio  public mehan;
    bio public  mega;
    function bio_data() public{
    mehan.name = "mehan";
    mehan.age = 17;
    mehan.gender ="male";
    mega=bio("megari",17,"female");
    }
    
}