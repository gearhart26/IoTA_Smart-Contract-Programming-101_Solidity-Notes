// CONTRACT INHERITANCE //
//Putting modifiers and state variables into their own contract that will act as the parent contract

//During Inheritance, all internal and public functions and variables are shared with derived contracts BUT private state variables and private functions are NOT inherited by derived contracts 

pragma solidity 0.7.5;

//since i moved the base contract ownable to its own file we need to import it here
import "./ownable_Inheritance.sol";

//reusing code from PayableFunctions. This will act as the child contract 
    contract Bank_InheritanceExample is Ownable{
    
    }
