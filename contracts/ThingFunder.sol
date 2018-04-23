pragma solidity ^0.4.12;

contract ThingFunder {
	address public backer;
	address public maker; 
	uint divisor;

	constructor (address _maker) payable {
		backer = msg.sender;
		maker = _maker;
		divisor = 0;
	}

	function setDivisor() {
		divisor = address(this).balance/uint(4);
	}

	function getDivisor() constant returns(uint) {
		return divisor;
	}

	function payoutToMaker() payable {
		if (msg.sender == backer) {
			maker.transfer(divisor);
		}
	}
	
	function refundToBacker() payable {
	    require(msg.sender == maker && msg.value == divisor);
	    backer.transfer(divisor);
	}

	function getBalance() constant returns (uint) {
		return address(this).balance;
	}
}

// add function for backer to add more donations in case they want to donate more, or they were refunded and want to donate again... recalculate divisor? 