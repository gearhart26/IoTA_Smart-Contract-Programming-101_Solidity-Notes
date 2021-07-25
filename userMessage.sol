pragma solidity 0.7.5;

contract userMessage {
    
    //empty state variable "in contract scope"
    string message;  
    
    //constructor to take user input and set as new message value
    constructor(string memory _message){
        message = _message;
    }

   function hello() public view returns(string memory){
        return message;
    }
}
