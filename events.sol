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
                
        modifier onlyOwner{
            require(msg.sender == owner);
            _;
        }
        
        constructor(){
            owner = msg.sender;
        }
        
//new code
        //adding emit to trigger balanceAdded event defined above
        function addBalance(uint _ToAdd) public onlyOwner returns(uint){
            balance[msg.sender] += _ToAdd; 
            emit balanceAdded(_ToAdd, msg.sender);
            return balance[msg.sender];
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
        
//new code
        //adding emit to trigger balanceTransfered event defined above
        function _transfer(address from, address to, uint amount) private {
            balance[from] -= amount;
            balance[to] += amount;
            emit balanceTransfered(amount, to);
        }
    }
