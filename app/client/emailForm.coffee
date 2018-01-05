
Template.emailForm.events
	'submit #sky-form3': (e,t) ->
		e.preventDefault()
		name = $('#name').val()
		email = $('#email').val()
		message=$('#message').val()
		phone=$('#phone').val()

		from=email
		text=message


		obj=
			from:from
			text:text
			name:name
			phone:phone
			email:email
			message:message
		Meteor.call 'sendEmail',obj,(error)->
			if (error?)
				console.log 'There was an error'


