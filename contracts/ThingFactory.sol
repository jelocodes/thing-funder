pragma solidity ^0.4.12;
import "./ThingFunder.sol";

contract ThingFactory {
    
    event lastContract(address latestContract);
    
    event newContractOutput(address newContract);
    
    // deploy a new contract 
    function newProject(address _maker) public {
        ThingFunder t = new ThingFunder(_maker);
    }

}