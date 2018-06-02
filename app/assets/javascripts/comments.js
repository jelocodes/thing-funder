// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function Comment(attributes) {
	this.id = attributes.id;
	this.user_id = attributes.user_id
	this.user = attributes.user;
	this.content = attributes.content;
}

Comment.prototype.renderCommentMarkup = function() {
	return Comment.template(this);
}

$(function() {

	$("div.wrapper").on("submit", 'form#new_comment', function(e){
		e.preventDefault();

		Comment.templateSource = $("#comment-section-template").html();
 		Comment.template = Handlebars.compile(Comment.templateSource);

		let $form = $(this); 
		let action = $form.attr("action")
		let params = $form.serialize()

		$.ajax({
			url: action,
			data: params,
 			dataType: "json",
			method: "POST"
		}).success(function(json){
			let comment = new Comment(json);
			let commentMarkup = comment.renderCommentMarkup();
			$('div.c-section').prepend(commentMarkup);
		})		
   })

	$("div.wrapper").on("click", 'a.commentDelete', function(e){
		e.preventDefault();
		$(this).parent().remove();
		$.ajax({
			url: `/comments/${$(this).attr('id')}`,
			dataType: 'json',
			type: 'DELETE'
		})
	})
});


