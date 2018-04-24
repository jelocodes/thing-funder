pragma solidity ^0.4.12;

contract ThingFunder {
	address public backer;
	address public maker; 
	uint divisor;
	uint timesRefunded;

	constructor (address _maker) payable {
		backer = msg.sender;
		maker = _maker;
		divisor = address(this).balance/uint(4);
		maker.transfer(divisor);
		timesRefunded = 0;
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
	    timesRefunded += 1;
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
}

// allow for repeated deposits if they have been refunded and time has yet to run out
// add time/date run out... everything works except the check to keep funding even if timesRefunded is less than 0