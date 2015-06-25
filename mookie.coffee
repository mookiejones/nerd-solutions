if Meteor.isClient
	# Counter starts at 0
	Session.setDefault 'counter',0
	Session.setDefault 'loaded',false

	$('a[href^=#').on('click', (event)->
		event.preventDefault()
		$link=$(this)
		$target=$($link.attr('href'))
		$('html,body').animate
			scrollTop:$target.offset().top
		,660
		)

	Meteor.setTimeout ->
		$('body').removeClass('is-loading').addClass('is-loaded')
		$('.pre-loader').fadeOut()
		$window.trigger('scroll')
	,800

	$window=$(window)
	$window.on('scroll',->
		$('section').each (index,section)->
			$section=$(section)
			sectionTop=$section.offset().top
			sectionBottom=$section.offset().top + $section.height()
			if $window.scrollTop() >= sectionTop and $window.scrollTop()<sectionBottom
				$section.addClass 'current'
			else
				$section.removeClass('current').removeClass 'animate'
		$('section:in-viewport(200)').do ->
			console.log 'animating'
			$(this).addClass('animate')
			$navItem=$('nav a[href=#'+$(this).attr('id'+']'))
			$('nav a').removeClass 'current'
			$navItem.addClass 'current'
		)



Template.appBody.rendered=->
	window.scrollReveal=new scrollReveal()
	window.setTimeout ->
		Router.go 'home'
	,800

Template.appBody.events
	'loaded #maindiv':->
		console.log 'loaded'
	'click a':(evt)->
		console.log 'click'
		$link=$(this)
		$target=$($link.attr('href'))

   # $("html,body").animate({
   #   scrollTop: $target.offset().top
   # }, 660);

Template.appBody.helpers
	isLoading:  ->
		result='is-loading'
		console.log 'result',result
		if Session.get('loaded') is true
			result=''
		result

