# thingfunder.com

ThingFunder was a project conceptualized as a crowdfunding decentralized application that would backers to fund projects through the Ethereum blockchain. For now, it's a Rails app that demonstrates the basic CRUD functionality of a crowdfunding platform. Users can sign up (via email or via Facebook using oAuth), create projects, edit their created projects, and view and comment on the projects of others. It uses Rails for the back-end and ActiveRecord for the database.

# Installation & Usage

To play around with this app, clone or download this repo and install dependencies via ```bundle install```. Afterwards, run ```rake:db``` to create the database, run ```db:seed``` (optionally) to populate it with randomized test data using the Faker gem, and start the local server using the ```rails s``` command. Initiate a console via ```rails c``` in order to play around with the models.

# Contributing

This project is still under development, and bug and pull requests are welcome on Github at https://github.com/jelocodes/thing-funder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.

# License

This codebase is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
