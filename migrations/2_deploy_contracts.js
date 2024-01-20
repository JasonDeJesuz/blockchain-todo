// Let me explain what this file does. Any time we create a new smart contract, we are updating the state of the blockchain. 
// Remember, I said that a blockchain fundamentally is a database. Hence, whenever we permanently change it, we must migrate it from one state to another. 
// This is very similar to a database migration that you might have performed in other web application development frameworks.

// Notice that we number all of our files inside the migrations directory with numbers so that Truffle knows which order to execute them in. 
// Inside this newly created migration file, you can use this code to deploy the smart contract:

var TodoList = artifacts.require("./TodoList.sol");

module.exports = function(deployer) {
  deployer.deploy(TodoList);
};