
// ERROR HANDELING  //

// require() = checks for valid conditions, checks inputs, revert to undo unathorized actions
// require(balance > amountToBeSent)
// require(inputNumber > 10)
// require(msg.sender = owner)
// should have require() at beging of functions to be seen before exicution

// assert() = made to test for internal errors, check invariants
// errors in assert() should only be thrown if there are actual internal errors in contract
// if the code is correct assert() should never throw an error
// not to be used to check inputs or conditions like require()
// assert() basicly checks the result against the expected outcome to make sure the code is being exicuted as intended
// invariants => a concept; condition that is always true at a particular point in the code
// invariant example: when sending all funds; at the end of transaction balance should be = 0

pragma solidity 0.7.5;
    
//reusing code from mapping and visibility
    contract Bank_RequireExample{
    
        //this mapping ties "balance" to the key "address" 
        mapping(address => uint) balance;

//new code here
        //creates variable owner for adress to be used in require(), like administrator priviliges 
        address owner;
        
        //sets owners adress to the address that deployed the smart contract for require()
        constructor(){
            owner = msg.sender;
        }
        
