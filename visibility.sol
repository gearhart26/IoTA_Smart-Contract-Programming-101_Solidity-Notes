pragma solidity 0.7.5;

//visibility levels (functions&variables) = from where should our function be able to be exicuted from
// public = everyone everywhere (anyone can ecicute function)
// private = only from within (within contract itsself like a helper function that needs to be called in the actual code)
// internal = private(can only be activated from within) and any contracts deriving from it(or inherited from private contract)
// external = only other contracts (to make sure it isnt called by mistake and can only be called externally by other contracts)

//code reused from mapping
    contract Bank_VisibilityExample{
    
    //this mapping ties "balance" to the key "address" 
    mapping(address => uint) balance;
    
    //takes the address of the sender and amount of balance to add as input and returns new balance
    function addBalance(uint _balanceToAdd) public returns(uint){
        balance[msg.sender] += _balanceToAdd; 
        return balance[msg.sender];
    }
    
    //returns user balance associated with their address
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }

//new code starts here

    //allows user to transfer balance from thir address to another
    function transfer(address recipient, uint amount) public {
        //calling private function(one that can only be called from within contract)
        //this helps with compartmentalization and makes updating code easier
        _transfer(msg.sender, recipient, amount);
    }
    
    //private function to be called by function above
    function _transfer(address from, address to, uint amount) private {
        //takes balance from senders address & adds balance to recipiant's address 
        balance[from] -= amount;
        balance[to] += amount;
    }
}

