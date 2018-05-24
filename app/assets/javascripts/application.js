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


	// tabs

	$("div.wrapper").on("submit", 'form#new_comment', function(e){
		e.preventDefault();

		let $form = $(this); //this always refers to the item that triggered the event
		let action = $form.attr("action")
		let params = $form.serialize()

		$.ajax({
			url: action,
			data: params,
 			dataType: "json",
			method: "POST"
		}).success(function(json){
			console.log(json);
			let source = $('#comment-section-template').html()
			let template = Handlebars.compile(source)
			let html = template(json)
			$('div.c-section').prepend(html);
		})
		
   })

	
});
