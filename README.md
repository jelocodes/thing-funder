# thingfunder.com

ThingFunder is a project conceptualized as a crowdfunding decentralized application that could let backers fund projects through the Ethereum blockchain in a more secure, accountable way. It uses the Chrome Metamask extension, along with the EthJS library, for Blockchain functionality. Locally, it's a Rails app that uses ActiveRecord and sqlite3 for data persistance, along with the Handlebars templating engine, AJAX, and jQuery for asynchronous features. Users can sign up (via email or via Facebook using oAuth), create projects, edit their created projects, and view and comment on the projects of others. Additionally, users with Metamask installed can donate to the sample projects via the Ropsten Ethereum test network. 

# Installation & Usage

To play around with this app, clone or download this repo and install dependencies via ```bundle install```. Afterwards, run ```rake db:create``` to create the database, run ```db:seed``` (optionally) to populate it with randomized test data using the Faker gem, and start the local server using the ```rails s``` command. Initiate a console via ```rails c``` in order to play around with the models, and open a browser window to ```localhost:3000``` to preview and navigate the app. In order to try out the Ethereum smart contract functionality, install [Metamask](https://metamask.io/), the Chrome extension that allows your browser to interface with the Ethereum blockchain. After installing, create an account, switch to the Ropsten test network and procure test Ether [here](https://faucet.metamask.io).

# Contributing

This project is still under development, and bug and pull requests are welcome on Github at https://github.com/jelocodes/thing-funder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.

# License

This codebase is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
