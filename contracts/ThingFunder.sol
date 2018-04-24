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

	function payoutToMaker() payable {
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
}

// allow for repeated deposits if they have been refunded and time has yet to run out[check]
// add time/date run out... everything works except the check to keep funding even if timesRefunded is less than 0
// allow only giving back to donors if they have been paid out, add a pay out counter [check]