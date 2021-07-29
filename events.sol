pragma solidity 0.7.5;
    
//reusing code from Modifiers
    
    contract Bank_EventsExample{
        
        mapping(address => uint) balance;
        
        address owner;
//new code
        // defining events to be triggered later in code
        event balanceAdded (uint amount, address depositedTo);
        event balanceTransfered (uint amount, address transferedTo);
        
        //To check the blockchain for event triggers or events triggered in the past 
        //"indexed" alows you to search for events that happend in the past that are indexed to a certain parameter that we reference with the "indexed" prefix
        //can only have 3 indexed parameters per event
        //i think this is the concept that allows etherscan to track wallet balances
        //event balanceAdded (uint amount, indexed address depositedTo);
        //event balanceTransfered (uint amount, indexed address transferedTo);
