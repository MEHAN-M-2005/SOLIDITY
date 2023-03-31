//SPDX-License-Identifier:MIT
pragma solidity 0.8.7;
contract todolist{
    struct todo{
        string text;
        bool done;
    }
    todo[] public todoo;
    function add(string memory _text) public{
        todoo.push(todo({
            text:_text,
            done: false
        }));
    } 
    function update(uint index,string memory _data) public{
        todoo[index].text=_data;
    }
    function print(uint index) public  view returns(string memory,bool){
        todo memory todoos=todoo[index];
        return(todoos.text,todoos.done);
    }
    function jugde(uint _completed) public {
        todoo[_completed].done = !todoo[_completed].done;
    }
}