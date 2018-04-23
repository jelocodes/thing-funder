contract ThingFunder {
	address public backer;
	address public maker; 
	uint divisor;

	constructor (address _maker) {
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
			seller.send(address(this).balance);
		}
	}

	function refundToBacker() payable {
		if(msg.sender == maker) {
			buyer.send(address(this).balance);
		}
	}

	function getBalance() {
		return address(this).balance;
	}
}