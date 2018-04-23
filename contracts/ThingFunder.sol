contract ThingFunder {
	address public backer;
	address public maker; 

	constructor (address _maker) {
		backer = msg.sender;
		maker = _maker;
	}

	function payoutToMaker() {
		// function to send funds to the maker in parts
	}

	function refundToBacker() {
		// function to refund remaining funds to backer
	}

	function getBalance() {
		// to check balance
	}
}