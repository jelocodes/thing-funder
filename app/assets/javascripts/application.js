// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require bootstrap/dist/js/bootstrap
//= require rails-ujs
//= require turbolinks
//= require web3check
//= require_tree .
//= require handlebars-v4.0.11

// Handlebar Helpers

Handlebars.registerHelper("divide", function(thing1, thing2) {
	return Math.floor(Number(thing1) / Number(thing2) * 100);
});

Handlebars.registerHelper("days_to_go", function(deadline) {
	let daysLeft = Math.floor((new Date(deadline) - new Date()) / 86400000);
	return daysLeft > 0 ? daysLeft : 0
});

Handlebars.registerHelper("if_project_over", function(deadline, opts) {
	let daysLeft = Math.floor((new Date(deadline) - new Date()) / 86400000);
	if (daysLeft <= 0) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}
});

Handlebars.registerHelper("project_backer_contract", function(project_backers){
	let contract;
	project_backers.find(function(backer){
		if (backer.user_id === $('a.current_user').data('user-id')) {
			contract = backer.contract;
    	}
	})
	return contract;	
})

Handlebars.registerHelper("current_user_percentage_backed", function(project_backers){
	let percentage_backed = 0;
	project_backers.find(function(backer){
		if (backer.user_id === $('a.current_user').data('user-id')) {
			percentage_backed = backer.percentage_backed;
    	}
	})
	return percentage_backed;
});

Handlebars.registerHelper("if_current_user_has_fully_donated", function(project_backers, opts) {
	let percentage_backed = 0;
	project_backers.find(function(backer){
		if (backer.user_id === $('a.current_user').data('user-id')) {
			percentage_backed = backer.percentage_backed;
    	}
	})
	if (percentage_backed === 100) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}	
})

Handlebars.registerHelper("if_current_user_is_not_backer", function(backers, opts){
	let found = false;
	backers.forEach(function(backer){
		if (backer.username === $('a.current_user').data('user-name')) {
			found = true;
		}
	})
	if (found === false) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}
});

Handlebars.registerHelper("if_any_days_left", function(deadline, funded, backers, opts) {
	let daysLeft = Math.floor((new Date(deadline) - new Date()) / 86400000);
	let found = false;
	backers.forEach(function(backer){
		if (backer.username === $('a.current_user').data('user-name')) {
			found = true;
    	}
	})
	if (daysLeft > 0 && funded === false && found === false) {
		return opts.fn(this);  
	} else {
		return opts.inverse(this);
	}
});

Handlebars.registerHelper("if_funded", function (funded, opts){
	if (funded === true) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}
})

Handlebars.registerHelper("backer_length", function(backers) {
	return backers.length;
})

Handlebars.registerHelper("if_backed", function(backers, opts) {
	let found = false;
	backers.forEach(function(backer){
		if (backer.username === $('a.current_user').data('user-name')) {
			found = true;
    	}
	})
	if (found === true) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}	
});

Handlebars.registerHelper("if_eq", function(a, opts) {
	if (a == $('a.current_user').data('user-name')) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}
})

Handlebars.registerHelper("if_eq_id", function(a, opts) {
	if (a == $('a.current_user').data('user-id')) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}
})

Handlebars.registerHelper("currentUser", function() {
	return $('a.current_user').data('user-id')
})

Handlebars.registerHelper("getToken", function() {
	return $('head meta:nth-child(3)').attr('content');
})

Handlebars.registerHelper("published", function(a, opts) {
	if (a == true) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}
})

$(document).ready(function() {
	// add new reward form

	let i = 2;
	const thing = $('.first').html();

	$('.more-reward.user').unbind().click(function(event){  // need to unbind click actions to prevent them from repeating
  		event.preventDefault();
  		$('.reward-tiers').append("<h4 class='user'>Reward Tier " + `${i}` + "</h4>" + thing);
		i++;
		$.ajax({
			url: '/rewards',
			type: 'POST',
			data: {
				reward: {
				project_id: $('input#project_rewards_attributes_0_project_id').val(), 
				name: $(`input[placeholder="Enter reward's name"]`).last().val(), 
				description: $(`textarea[placeholder="Describe what donors will get with this reward."]`).last().val(), 
				pledge_requirement: $(`input[placeholder="Enter the amount required to avail this reward."]`).last().val()}},
			success: function(data) {
				alert("Successful");				
			},
			failure: function() {
				alert("Unsuccessful");
			}
		});
	});
	
});
