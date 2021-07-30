// PAYABLE FUNCTIONS //
//Writing our first smart contract that can actually hold real crypto currency

//reusing code from Events
pragma solidity 0.7.5;
    
    contract Bank_PayableFunctionsExample{
        
        mapping(address => uint) balance;
        
        address owner;

//New code here; editing event 
        event depositDone (uint amount, address depositedTo);
        
        event balanceTransfered (uint amount, address transferedTo);
        
        modifier onlyOwner{
            require(msg.sender == owner);
            _;
        }
        
        constructor(){
            owner = msg.sender;
        }
