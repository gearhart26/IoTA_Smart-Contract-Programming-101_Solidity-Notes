pragma solidity 0.7.5;

contract StructExample{
    //definition of what a person is like defining a class in other languages
    //choose all the properties a "Person" should have
    struct Person {
        uint age;
        string name;
    }
    //making an array of Persons called people
    Person[] people;
    
    //function that asks user for name and age to be added to array as a new Person
    function addPerson(uint _age, string memory _name) public {
        //creating new variable of type person(meaning it has an age and a name like we defined in struct)
        //then we assign those properties to the actual object using the name and age
        Person memory newPerson = Person(_age, _name);
        //add new person to array
        people.push(newPerson);
    }
    //gets and returns a user specified person's properties from array
    //cannot "return(Person)" so you have to return the two properties of the person with "returns(uint, string memory)"
    function getPerson(uint _index) public view returns(uint, string memory){
        //setting variable "personToReturn" for person at chosen index 
        Person memory personToReturn = people[_index];
        //returning chosen properties of struct "Person" at index chosen by user
        return (personToReturn.age, personToReturn.name);
    }
    
}


contract MappingBalanceToAddressExample{
    
    //this mapping ties an usigned integer variable "balance" to the key "address" 
    //so given an adress it will instantly return that balance without having to search for it like you would have to in an array
    mapping(address => uint) balance;
    //changing state varable balance (so not pure or view) and returning new balance
    function addBalance(uint _balanceToAdd) public returns(uint){
        //takes the address of the sender as input and returns their value plus value being added to balance
        balance[msg.sender] += _balanceToAdd;    //longer way to write same thing=> balance[msg.sender] = balance[msg.sender] + _balanceToAdd;
        return balance[msg.sender];
    }
    //returns user balance associated with their address
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
}


