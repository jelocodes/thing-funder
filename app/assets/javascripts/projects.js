// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

Handlebars.registerHelper("divide", function(thing1, thing2) {
	return Math.floor(Number(thing1) / Number(thing2) * 100);
});

Handlebars.registerHelper("if_eq", function(a, opts) {
	if (a == $('a.current_user').data('user-name')) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}
})

Handlebars.registerHelper("published", function(a, opts) {
	if (a == true) {
		return opts.fn(this);
	} else {
		return opts.inverse(this);
	}
})

$(function () {
 	$('input.btn.blue.sorting').on('click', function(event) {
   		//prevent form from submitting the default way
   		event.preventDefault();

   		$.getJSON(`/?sort=${$(this).data('sort-by')}`, function(data) {
			let source = $("#entry-template").html();
			let template = Handlebars.compile(source);
   			$('div.project-results').html(template(data)) 
   		})
 	});
});

