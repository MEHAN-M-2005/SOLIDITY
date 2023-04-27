//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;
contract array
{
    struct Todo
    {
        string name;
        uint age;
        string place;
        string gender;
    }
    Todo[] public mehan;
    Todo[] public mega;
    function hug() public 
    {
       mehan.push(Todo("mehan",17,"salem","male"));
       mehan.push(Todo("mehann",17,"salem","male"));
       mega.push(Todo({name:"mehan",age:17,place:"salem",gender:"male"}));

   
       
    }
    function up(uint index,string memory called) public
        {
            Todo storage yoyo = mehan[index];
            yoyo.name = called;
        }
    
   
}
