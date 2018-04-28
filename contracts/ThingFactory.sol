pragma solidity ^0.4.12;
import "./ThingFunder.sol";

contract ThingFactory {
    // index of created contracts
    address[] public projects;
    
    function getProjectCount() public constant returns(uint projectCount) {
        return projects.length;
    }
    
    function getLastProject(uint _index) public constant returns(address lastProject) {
        return projects[_index];
    }
    
    // deploy a new contract 
    function newProject(address _maker) public {
        projects.push(new ThingFunder(_maker));
        return address(projects[projects.length + 1]);
    }
}