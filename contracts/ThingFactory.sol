pragma solidity ^0.4.12;
import "./ThingFunder.sol";

contract ThingFactory {
    
    // deploy a new contract 
    function newProject(address _maker) public returns(address newContract) {
        return new ThingFunder(_maker);
    }
}