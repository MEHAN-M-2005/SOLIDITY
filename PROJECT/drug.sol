//SPDX-License-Identifier:MIT
pragma solidity 0.8.7;
contract trace_drug
{
    //get input about drug
    //only owner can access the input and change it
    //update drug details
    //get drug
    string s="use index "
            "0=serial_no:no "
            "1=drug_name:name "
            "2=drug_quantity:weight "
            "3=drug_value:amount ";
    struct drug{
        uint serial_no;
        string drug_name;
        uint drug_quantity;
        uint drug_value;
    }
    address owner=msg.sender;
    drug[] public drugs;
    function insert_data(uint no,string memory name, uint weight, uint amount) public 
    {
        drugs.push(drug({
            serial_no:no,
            drug_name:name,
            drug_quantity:weight,
            drug_value:amount
        }));
    }
    function update_data(uint index0, uint no1)  public
    {   //uint index0=0;
        drugs[index0].serial_no=no1;
    }
    function up_name(uint index1, string memory name1)  public
    {
        //uint index1=1;
        drugs[index1].drug_name=name1;
    }
    function up_quantity(uint index2, uint weight1) public{
        //uint index2=2;
        drugs[index2].drug_quantity=weight1;
    }
    function up_value(uint index3, uint amount1) public{
        //uint index3=3;
        drugs[index3].drug_value=amount1;
    }
    function show() public view returns(string memory)
    {
        return s;
    }
    function access(uint indexx) view public returns(uint,string memory,uint,uint)
    {
        drug memory drrug=drugs[indexx];
        return(drrug.serial_no,drrug.drug_name,drrug.drug_quantity,drrug.drug_value);
    }
}