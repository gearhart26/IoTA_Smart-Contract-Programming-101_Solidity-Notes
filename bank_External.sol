// BANK_EXTERNAL CHILD CONTRACT //
//Reusing code from Bank_internal
//To be used with Destroyable.sol & Ownable.sol in projects&Assignments

import "./Solidity_101_Projects&Assignments/Destroyable.sol";
import "./Solidity_101_Projects&Assignments/Ownable.sol";

pragma solidity 0.7.5;

//New Code Here
        //To interact with another smart contract our contract needs to know 2 things,
        // 1: What the other smart contract looks like; what the functions are, what are its inputs, etc.
        // 2: We also need to know where the other contract is located
        //Adding an interface to solve these two problems, allowing our contract to interact with the government.sol contract
    interface GovernmentInterface{
            //Does not need the function body, only the function head but only works for external functions
            //But if the function returns something then that also needs to be included in the function head
        function addTransaction(address _from, address _to, uint _amount) external;
    }
        
    contract Bank is Ownable, Destroyable {
        
//New Code Here
            //To use the interface defined above we need to create an instance of the external contract within our own contract by instanciating an instance of the GovernmentInterface using an address
            //To accomplish this we need the address of the already deployed contract(this means to use another contract like this in remix we have to deploy the external contract first for it to work)
            //In remix; every time you redeploy Govenrment_External you have to change the address for the government interface or else it wont work
            //Basicly; combining the interface with where is it to give our contact the two things we said it needed above
        GovernmentInterface governmentInstance = GovernmentInterface(0x41c4c4e7ed7800e18B7CEEEF4Cb5d24BF315655A);
        
        mapping(address => uint) balance;
        
        event depositDone (uint amount, address depositedTo);
        
        event balanceTransfered (address transferedFrom, uint amount, address transferedTo);
        
      }
