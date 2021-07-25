pragma solidity 0.7.5;

contract if_else {
    
    //state variable
    string message;
    
    constructor(string memory _message){
        message = _message;
    }
    function hello() public view returns(string memory){
        //Only returns string if the senders adress is equal to
        // msg.value Only returns message if senders account balance = msg.value
        if(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4){
            return message;
        }
        else{
            return "Wrong address";
        }
    }
    
}
//Loops in solidity are very similar to JavaScript

//Function that counts up 10 from whatever number is inputed then returns it
//These two functions do the same thing except one uses for and the other while
contract Loops {
    function count_while(int number) public pure returns(int){
        int i = 0;
        while(i < 10){   //loop will continue until i is no longer smaller than 10
            number++;    //increase number by one, number = number + 1
            i++;         //incriment counter by one, i = i + 1
        }
        return number;   //always gotta end a function by returning whatever value you are working on
    }
    
    function count_for(int number) public pure returns(int){
        for(int i=0; i<10; i++){
            number++;
        }
        return number;
    }
}
