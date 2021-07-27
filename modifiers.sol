// MODIFIERS //

// modifiers = smaller function that always runs just before a real function
//way to seperate and reuse logic that is going to be used repeatadly throughout contract

pragma solidity 0.7.5;
    
//reusing code from Require&Assert
    
    contract Bank_ModifierExample{
        mapping(address => uint) balance;
        address owner;
        
//New code here
        //modifiers offer a more seemless way to set permissions on certain functions
        //can be reused throuought contract by calling in function header after "public"
        //will run this modifier before starting a function when declared in function head
        //restricting access like this is the most common use of modifiers in solidity
        modifier onlyOwner{
            require(msg.sender == owner);
            // "_;" <= tells the code to run the function once the modifier has run; which in this case means once the require() condition is checked
            // basicly signifies the modifier is done, run the function body
            _;
        }
