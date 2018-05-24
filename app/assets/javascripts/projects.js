// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

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
		return "<h2 class='message'>Choose a reward tier below!</h2>"  
	} else {
		return "<h2 class='message'>Thanks for backing the project!</h2>"
	}
});

Handlebars.registerHelper("backer_length", function(backers) {
	return backers.length;
})

Handlebars.registerHelper("if_backed", function(backers) {
	let found = false;
	backers.forEach(function(backer){
		if (backer.username === $('a.current_user').data('user-name')) {
			found = true;
    	}
	})
	return found;	
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

$(function () {

	// $(window).load(function() {
	// 	$.getJSON('/', function(data) {
	// 		let source = $("#entry-template").html();
	// 		let template = Handlebars.compile(source);
 //   			$('div.project-results').html(template(data)) 
 //   		})
	// })

 	$('input.btn.blue.sorting').on('click', function(event) {
   		//prevent form from submitting the default way
   		event.preventDefault();

   		$.getJSON(`/?sort=${$(this).data('sort-by')}`, function(data) {
			let source = $("#entry-template").html();
			let template = Handlebars.compile(source);
   			$('div.project-results').html(template(data)) 
   		})
 	});

	$('div.wrapper').on('click', 'a.prevLink', function(event) {
		event.preventDefault();
		$.getJSON(`/projects/${$(this).data('id') - 1}`, function(data) {
			let source = $("#project-show-template").html();
			let template = Handlebars.compile(source);
			$('div.wrapper').html('')
			$('div.wrapper').html(template(data))
		})	
	})


	$('div.wrapper').on('click', 'a.nextLink', function(event) {
		event.preventDefault();
		$.getJSON(`/projects/${$(this).data('id') + 1}`, function(data) {
			let source = $("#project-show-template").html();
			let template = Handlebars.compile(source);
			$('div.wrapper').html('')
			$('div.wrapper').html(template(data))
		})	
	})
});

