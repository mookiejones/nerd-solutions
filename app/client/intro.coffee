
Template.intro.created =(cb)->
	$(document).ready ->
      


Template.intro.rendered=->
   x = $('.fullscreenbanner')
   x.revolution

	# $('.fullscreenbanner').revolution
   	delay: 15000
   	startheight: 500
   	startwidth: 1170

   	hideThumbs: 10

	# 	#extras
	# 	thumbWidth:100
	# 	thumbHeight:50
	# 	thumbAmount:5
	# 	navigationType:'both'
	# 	navigationArrows:'nexttobullets'
	# 	navigationStyle:'round'
	# 	touchenabled:'on'
	# 	onHoverStop:'on'


	# 	fullWidth: 'on'
	# 	fullScreen: 'on'

	# 	hideCaptionAtLimit: ''
	# 	dottedOverlay: 'twoxtwo'
	# 	navigationStyle: 'preview4'
	# 	fullScreenOffsetContainer: ''	