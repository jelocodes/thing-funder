window.addEventListener('load', function() {
	if (typeof web3 !== 'undefined') {
		// startApp(web3);
		console.log('loaded!');
	} else {
		// Warn the user that they need to get a web3 browser
		// Or install MetaMask, maybe with a nice graphic.
		console.log('Download MetaMask');
	}
})