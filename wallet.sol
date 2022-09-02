// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract wallet{
    address  owner;
    address payable user;

    constructor(){
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        require(msg.sender == owner, "you are not owner");
        _;
    }

    function get() payable public{

    }

    function setUser(address payable _user) public{
       require(msg.sender != owner, "owner not");
        user =_user;
    }

    function sendMoney() payable public OnlyOwner{
        user.transfer(1 ether);
    }

    function getBalance() public view OnlyOwner returns(uint){
        return address(this).balance;

    }
}
