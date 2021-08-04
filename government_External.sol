// EXTERNAL CONTRACTS EXAMPLE //
//External visibility level is how we are going to interact with other contracts 
//Example: connecting your contract to uniswap to tap into their liquidy 

//This contract is going to be an external contract that we are going to interact with through our ownable, destroyable, and bank contracts

pragma solidity 0.7.5;

        //Going to act like a government agency that requires records of all transactions
    contract Government {
        
            //structure to hold transaction information
        struct Transaction {
            address from;
            address to;
            uint amount;
            uint txId;
        }
        
            //Empty array to hold transaction objects created by struct
        Transaction[] transactionLog;
        
            //Adding event to notify us when a transaction has been succesfully logged
        //event transactionLogged (address sentFrom, address sentTo, uint amount, uint transactionId);
        
            //Function to take transaction information and append it to an object within transactionLog
            //Added external visibility level; makes it so a function with external visibility can only be called from other contracts on the outside. 
            //External cannot be executed from within the contract or through any other application, it has to be another contract.
        function addTransaction(address _from, address _to, uint _amount) external {
                //Creating a new Transaction object saving it to a variable and push the variable directly into out transactionLog
            transactionLog.push( Transaction(_from, _to, _amount, transactionLog.length) );
                
                //Another way to do it without directly pushing it into the array(by temporally saving the variable to memory) but more code for no benifit
            //Transaction memory _transaction = Transaction(_from, _to, _amount, transactionLog.length);
            //transactionLog.push(_transaction)
        
                //emiting our event notification    
            //emit transactionLogged(_from, _to, _amount, transactionLog.length);
        }
        
            //another function to look up transactions from our log
        function getTransaction(uint _index) public view returns(address, address, uint) {
            return (transactionLog[_index].from, transactionLog[_index].to, transactionLog[_index].amount);
        }
    }
