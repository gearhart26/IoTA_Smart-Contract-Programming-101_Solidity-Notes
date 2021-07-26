
// ERROR HANDELING  //

// require() = checks for valid conditions, checks inputs, revert to undo unathorized actions
// require(balance > amountToBeSent)
// require(inputNumber > 10)
// require(msg.sender = owner)
// should have require() at beging of functions to be seen before exicution

// assert() = made to test for internal errors, check invariants
// errors in assert() should only be thrown if there are actual internal errors in contract
// if the code is correct assert() should never throw an error
// not to be used to check inputs or conditions like require()
// assert() basicly checks the result against the expected outcome to make sure the code is being exicuted as intended
// invariants => a concept; condition that is always true at a particular point in the code
// invariant example: when sending all funds; at the end of transaction balance should be = 0

pragma solidity 0.7.5;
    
//reusing code from mapping and visibility
    contract Bank_RequireExample{
    
        //this mapping ties "balance" to the key "address" 
        mapping(address => uint) balance;

//new code here
        //creates variable owner for adress to be used in require(), like administrator priviliges 
        address owner;
        
        //sets owners adress to the address that deployed the smart contract for require()
        constructor(){
            owner = msg.sender;
        }
        
        //takes the address of the sender and amount of balance to add as input and returns new balance
        function addBalance(uint _balanceToAdd) public returns(uint){
//new code here
            //makes sure only the owner of the smart contract can execute this function
            require(msg.sender == owner);
            balance[msg.sender] += _balanceToAdd; 
            return balance[msg.sender];
        }
        
        //returns user balance associated with their address
        function getBalance() public view returns (uint){
            return balance[msg.sender];
        }

        //allows user to transfer balance from thir address to another
        function transfer(address recipient, uint amount) public {
//new code here
            //checking to make sure sender has a balance greater than or equal to transfer amount and setting string value for error message to help with debugging
            require(balance[msg.sender] >= amount, "Insufficent Balance");
            //not allowing user to send funds to themselves, and setting error message
            require(msg.sender != recipient, "You cannot send funds to yourself");
            _transfer(msg.sender, recipient, amount);
        }
    
        //private function to be called by function above
        function _transfer(address from, address to, uint amount) private {
            balance[from] -= amount;
            balance[to] += amount;
        }
        
    }
    
    
//reusing code from above without comments for brevity

    contract Bank_AssertExample{
        mapping(address => uint) balance;
        address owner;
        constructor(){
            owner = msg.sender;
        }
        function addBalance(uint _balanceToAdd) public returns(uint){
            require(msg.sender == owner);
            balance[msg.sender] += _balanceToAdd; 
            return balance[msg.sender];
        }
        function getBalance() public view returns (uint){
            return balance[msg.sender];
        }
        function transfer(address recipient, uint amount) public {
            require(balance[msg.sender] >= amount, "Insufficent Balance");
            require(msg.sender != recipient, "You cannot send funds to yourself");

//new code here
            //a bit unnecessary but we need it in order to use an assert call in this example
            uint previousSenderBalance = balance[msg.sender];
            _transfer(msg.sender, recipient, amount);
            //an assertion that no matter what input is used or whatever happens this needs to be true or else something in the code is wrong
            //basicly a piece of code that checs to see if the math works out as expected
            assert(balance[msg.sender] == previousSenderBalance - amount);
            //assert should never even throw an error if everything works as it should
            //so if you see one something is really wrong
        }
        function _transfer(address from, address to, uint amount) private {
            balance[from] -= amount;
            balance[to] += amount;
        }
    }
    
    
