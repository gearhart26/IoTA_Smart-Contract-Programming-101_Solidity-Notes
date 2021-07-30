pragma solidity 0.7.5;

// DATA LOCATION //

contract DataLocationExample{

// 3 different locations we can store data in solidity: storage and memory are used most often
    // storage => permenant storage of data; data that is persistant over time and over function executions; mostly used for state variables
    // memory => temporary data storage; used in functions, function arguments, and variables within functions; basicly, variable will be stored until the function is finished executing then forgotten unless told otherwise
    // calldata => more advanced; similar to memory but read only, usually used when you only need to read data out of the function call; can be used to save and optimize gas usage since you do not have to pay as much for memory: cheaper to execute

    //state variables; can only be stored in storage so no need to specify
    uint data = 123;  //this variable is perminatly stored in storage; value can be changed but the variable is stored perminatly within contract
    
    // making a state variable to permenantly store the input string that is saved to memory in the function below
    string lastText;
    
    // uint, int, boolian, and other value types (unlike string) do not need memory prefix to be stored because simple data types are automaticly stored to memory
    
    function getString(string calldata text2, string memory text, uint number) public pure returns(string memory){
        
        // to save something that is stored in memory after a function runs then you have to implicity store it to a state variable or array outside the function
        // lastText = text;
        
        //this would normally allow you to change text2 if it was in memory but it is in calldata which is read only so it would not work here
        // text2 = "hello";
        
        return text2;   
    }   
}


//reusing code from above
contract DataLocationExample2{

    uint data2 = 123;
    string lastText2 = "Hello Dustin";
    
    function setString(string memory text2) public {
        
            //this does not work need to do something different
        //string memory newString = lastText2;
        //newString = text2;

            //this works
        lastText2 =text2;
    }   
}
