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
      }
