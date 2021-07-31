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
        
//New code here; changing the addBalance function
        //need to add payable keyword to function head so the contract can hold funds
        function deposit() public payable returns (uint) {
            //The line below is no longer necessary since the balance held by the smart contract is stored on the blockchain. Therefore we do not need to save it to the smart contract
            //basicly only keeps track internally of which addresses deposited what money
            balance[msg.sender] += msg.value; 
            emit depositDone(msg.value, msg.sender);
            return balance[msg.sender];
        }
        
        
 }
