contract ThingFunder {
	address public backer;
	address public maker; 

	constructor (address _maker) {
		backer = msg.sender;
		maker = _maker;
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