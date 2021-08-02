pragma solidity 0.7.5;

    contract Ownable {

        //once a state variable is made public it will automaticly create a function to get the value of that variable which can be super helpful and save alot of time
        address public owner;
        
         modifier onlyOwner{
            require(msg.sender == owner);
            _;
        }
        
        constructor(){
            owner = msg.sender;
        }
}
