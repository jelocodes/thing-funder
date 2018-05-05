pragma solidity ^0.4.12;
import "./ThingFunder.sol";

contract ThingFactory {
    
    address[] public contracts;
    
    event newContractOutput(address newContract);
    
    // deploy a new contract 
    function newProject(address _maker) public returns(address newContract) {
        ThingFunder t = new ThingFunder(_maker);
        contracts.push(t);
        return t; 
    }
    
    function lastContractCreated() public returns(address lastContract) {
        return contracts[contracts.length -1];
    }
}