//SPDX-LICENSE-Identifier: MIT

pragma solidity 0.8.15;

contract PaytoUpdateMessage {
    string public myString ="Hello World";
    address public owner;

    constructor(){
        owner = msg.sender; //initialize owner as the person who deployed the smart contract
    }

    function updateString(string memory _myString) public payable  {
        if(msg.sender == owner){
            myString = _myString; // owner does pay to update message
        } else{
            if(msg.value == 1 ether){
                payable(owner).transfer(msg.value); // if user is paying 1 ether then the message would be updated
                myString = _myString;
            } else {
                payable(msg.sender).transfer(msg.value); //if amount is not 1 ether refund payer
            }
        }
    }
}