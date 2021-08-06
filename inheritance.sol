// CONTRACT INHERITANCE //
//Putting modifiers and state variables into their own contract that will act as the parent contract

//During Inheritance, all internal and public functions and variables are shared with derived contracts BUT private state variables and private functions are NOT inherited by derived contracts 

pragma solidity 0.7.5;

//since i moved the base contract ownable to its own file we need to import it here
import "./ownable_Inheritance.sol";

//reusing code from PayableFunctions. This will act as the child contract 
    contract Bank_InheritanceExample is Ownable{
        
        mapping(address => uint) balance;
        
        event depositDone (uint amount, address depositedTo);
        
        event balanceTransfered (address transferedFrom, uint amount, address transferedTo);
        
        function deposit() public payable returns (uint) {
            balance[msg.sender] += msg.value; 
            emit depositDone(msg.value, msg.sender);
            return balance[msg.sender];
        }
        
        function withdraw(uint amount) public returns (uint) {
            require(balance[msg.sender] >= amount, "Insufficent Balance");
            balance[msg.sender] -= amount;
            msg.sender.transfer(amount);
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
            emit balanceTransfered(msg.sender, amount, recipient);
        }
        
        function _transfer(address from, address to, uint amount) private {
            balance[from] -= amount;
            balance[to] += amount;
        }
    }
