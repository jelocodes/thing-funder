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
		if (msg.sender == maker) {
			backer.transfer(divisor);
		}
	}

	function getBalance() constant returns (uint) {
		return address(this).balance;
	}
}