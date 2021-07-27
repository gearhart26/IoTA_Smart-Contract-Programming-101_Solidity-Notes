// MODIFIERS //

// modifiers = smaller function that always runs just before a real function
//way to seperate and reuse logic that is going to be used repeatadly throughout contract

pragma solidity 0.7.5;
    
//reusing code from Require&Assert
    
    contract Bank_ModifierExample{
        mapping(address => uint) balance;
        address owner;
        
//New code here
