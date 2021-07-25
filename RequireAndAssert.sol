pragma solidity 0.7.5;
//modifying state variables
contract Setter_function {
    //state variable
    int number;
    //this function gets the number from the state variable
    function getNumber() public view returns(int){
        return number;
    }
    //view and pure are left off because leaving it blank allows the function to EDIT and VIEW state variables
    //this function allows the user to set the number from the state variable
    function setNumber(int _number) public {
        number = _number;
    }
}



//creating and filling arrays(collections of variables like a list) in solidity
contract Arrays {
    //initializing an array, number in brakets = # of items in array -- leave it blank to make size limit unrestricted 
    //int[2] numbers = [3,67];
    int[] numbers;
    //adds user inputed numbers to array
    function addNumber(int _number) public {
        //.push only works on arrays with no size limit
        //to add to array with size limit; you have to specify the location in the array it is being saved to
        //numbers[0] = _number;
        numbers.push(_number);
    }
    //gets and returns specified number from numbers 
    //needs uint because there is no negative index positions in an array
    function getNumber(uint _index) public view returns(int){
        //returns number at user specified index in array
        return numbers[_index];
    }
    //to return entire array insted of item at specified index
    function getNumbers() public view returns(int[] memory){
        //returns all numbers in array
        return numbers;
    }
    
}
