// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function Project(attributes) {
	this.id = attributes.id;
	this.name = attributes.name;
	this.image_url = attributes.image_url;
	this.tagline = attributes.tagline;
	this.about = attributes.about;
	this.faq = attributes.faq;
	this.deadline = attributes.deadline;
	this["funded?"] = attributes["funded?"];
	this.user = attributes.user;
	this.published = attributes.published;
	this.backers = attributes.backers;
	this.project_backers = attributes.project_backers;
	this.categories = attributes.categories;
	this.updates = attributes.updates;
	this.funds = attributes.funds;
	this.goal = attributes.goal;
	this.rewards = attributes.rewards;
	this.comments = attributes.comments;
}

Project.prototype.renderProjectMarkup = function() {
	return Project.template(this);
}

$(function() {
 	$('input.btn.blue.sorting').on('click', function(event) {
   		event.preventDefault();

   		$.getJSON(`/?sort=${$(this).data('sort-by')}`, function(data) {

			let source = $("#entry-template").html();
			let template = Handlebars.compile(source);

			let projects = [] 

			data.forEach(function(element){
				projects.push(new Project(element));
			})

   			$('div.project-results').html(template(projects)) 
   		})
 	});

 	Project.templateSource = $("#project-show-template").html();
 	Project.template = Handlebars.compile(Project.templateSource);

	$('div.wrapper').on('click', 'a.prevLink', function(event) {
		event.preventDefault();
		$.getJSON(`/projects/${$(this).data('id') - 1}`, function(data) {

			let project = new Project(data);
			let projectMarkup = project.renderProjectMarkup();

			$('div.wrapper').html('')
			$('div.wrapper').html(projectMarkup)
		})	
	})


	$('div.wrapper').on('click', 'a.nextLink', function(event) {
		event.preventDefault();
		$.getJSON(`/projects/${$(this).data('id') + 1}`, function(data) {

			let project = new Project(data);
			let projectMarkup = project.renderProjectMarkup();

			$('div.wrapper').html('')
			$('div.wrapper').html(projectMarkup)		
		})	
	})
});

