pragma solidity ^0.4.12;

contract ThingFunder {
	address public backer;
	address public maker; 
	uint divisor;
	uint timesRefunded;
	uint timesBacked;

	constructor (address _maker) payable {
		backer = msg.sender;
		maker = _maker;
		divisor = address(this).balance/uint(4);
		maker.transfer(divisor);
		timesRefunded = 0;
		timesBacked = 1;
	}

	function getDivisor() constant returns(uint) {
		return divisor;
	}

	function payoutToMaker() {
		if (msg.sender == backer) {
			maker.transfer(divisor);
			timesBacked += 1;
		}
	}
	
	function refundToBacker() payable {
	    require(msg.sender == maker && msg.value == divisor && timesBacked > 0);
	    backer.transfer(divisor);
	    timesRefunded += 1;
	    timesBacked -= 1;
	}

	function fundAgain() payable {
	    require(msg.sender == backer && timesRefunded > 0 && msg.value == divisor);
		timesRefunded -= 1;
	}

	function getBalance() constant returns (uint) {
		return address(this).balance;
	}

	function getTimesRefunded() constant returns (uint) {
		return timesRefunded;
	}
	
	function getTimesBacked() constant returns (uint) {
	    return timesBacked;
	}
	
	function refundAllRemaining() {
	    require(msg.sender == maker && address(this).balance > 0);
	    backer.transfer(address(this).balance);
	}
}
