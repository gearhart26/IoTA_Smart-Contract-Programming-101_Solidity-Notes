// PAYABLE FUNCTIONS //
//Writing our first smart contract that can actually hold crypto currency

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
            owner = msg.sender
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
        
//New code here; new withdraw function
        //This only allows withdraws to your own address but can be easily changed to withdraw to any address
        function withdraw(uint amount) public returns (uint) {
            //address payable toSend = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;      <= another way to do it 
            // toSend.transfer(amount);                                                 <= another way to do it 
            
            //".transfer" is the safest way to do it in solidity
            //the ".transfer" function is great because if the transfer fails it will throw an error and revert the transaction just like if we added a require() ststement
            msg.sender.transfer(amount);       // msg.sender is an address
            //This function works but the major flaw with our".transfer" method is that anyone who made a deposit can withdraw all funds from the smart contract reguardless of who deposited the funds
        }
        
        function getBalance() public view returns (uint){
            return balance[msg.sender];
        }
        
        function transfer(address recipient, uint amount) public {
            require(balance[msg.sender] >= amount, "Insufficent Balance");
            require(msg.sender != recipient, "You cannot send funds to yourself");
            uint previousSenderBalance = balance[msg.sender];
            _transfer(msg.sender, recipient, amount);
            assert(balance[msg.sender] == previousSenderBalance - amount);
        }
        
        function _transfer(address from, address to, uint amount) private {
            balance[from] -= amount;
            balance[to] += amount;
            emit balanceTransfered(amount, to);
        }
    }
