// "OWNABLE_INTERNAL" BASE CONTRACT //
//Reusing code from ownable inheritance base contract
//Used with destroyable.sol from projects folder

pragma solidity 0.7.5;

    contract Ownable {

//New Code Here
        //Internal is similar private, it is only viewable within your contract or from any contract that is inheriting from it
        //Prevents anyone other than certain contracts from querying the variable
        address internal owner;
        
         modifier onlyOwner{
            require(msg.sender == owner);
            _;
        }
        
        constructor(){
            owner = msg.sender;
        }
    }
