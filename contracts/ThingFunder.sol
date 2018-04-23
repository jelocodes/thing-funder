contract ThingFunder {
	address public backer;
	address public maker; 

	constructor (address _maker) {
		backer = msg.sender;
		maker = _maker;
	}

	function payoutToMaker() {
		if (msg.sender == backer) {
			seller.send(this.balance);
		}
	}

	function refundToBacker() {
		if(msg.sender == maker) {
			buyer.send(this.balance);
		}
	}

	function getBalance() {
		return this.balance;
	}
}