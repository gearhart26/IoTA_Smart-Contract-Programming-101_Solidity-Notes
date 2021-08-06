// BANK_INTERNAL CONTRACT //
//Reusing code from Inheritance
//Used with destroyable.sol from projects folder

import "./Solidity_101_Projects&Assignments/Destroyable.sol";
import "./Solidity_101_Projects&Assignments/Ownable.sol";

pragma solidity 0.7.5;

    contract Bank is Ownable, Destroyable {
        
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
 //New Code Here       
        //adding a function getOwner to to deminstrate internal vs private
        //Owner = private  =>  cannot be called or viewed from outside contract it is declared in
        //Owner = internal  =>  can be queried and viewed by contract it is in and also all contracts that inherit from it
        function getOwner() public view returns (address){
            return owner;
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
