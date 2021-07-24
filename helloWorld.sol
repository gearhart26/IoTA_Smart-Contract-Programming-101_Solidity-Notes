//every contract starts with this structure like HTML 
//version of solidity to be used in this smart contract
pragma solidity 0.7.5;

//contract name
contract helloWorld {
    //declaring state(global) variables
    string message = "Hello World 2";
    
    //pure means the contract cannot interact with the rest of the contract
    function hello() public pure returns(string memory){
        return "Hello World 1";
    }
    //pure is replaced with view to allow the function to read (but not edit) state variables declared elseware in the contract like message
    function hello2() public view returns(string memory){
        return message;
    }

    //variable declared in function so it cannot be accessed by the rest of the contract but must be told to save string to memory
    function hello3() public pure returns(string memory){
        string memory message2 = "Hello World 3";
        return message2;
    }
}

// How to assign values by type in solidity. Can't use generic var like JaveScript
//    int a = 1;                                                 //signed integer
//    uint e = 2;                                                //unsigned integer (can only be used for positive numbers)
//    string b = "Potato";                                       //strings
//    bool c = false;                                            //boolians
//    address d = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;    // special solidity variable type for adresses


// How to allow acess and editing permissions of variables
// pure = cannot interact with anything outside function
// view = can read state variables but not edit
// *blank = no restriction acess and edit state variables
