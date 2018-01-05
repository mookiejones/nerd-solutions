###   
# Template Name: Unify - Responsive Bootstrap Template
# Description: Business, Corporate, Portfolio and Blog Theme.
# Version: 1.6
# Author: @htmlstream
# Website: http://htmlstream.com
###
if Meteor.isClient
  
  @App = do ->

    handleBootstrap = ->

    #   ###Bootstrap Carousel###
      jQuery('.carousel').carousel
        interval: 15000
        pause: 'hover'

      ###Tooltips###

      jQuery('.tooltips').tooltip()
      jQuery('.tooltips-show').tooltip 'show'
      jQuery('.tooltips-hide').tooltip 'hide'
      jQuery('.tooltips-toggle').tooltip 'toggle'
      jQuery('.tooltips-destroy').tooltip 'destroy'

      ###Popovers###

      jQuery('.popovers').popover()
      jQuery('.popovers-show').popover 'show'
      jQuery('.popovers-hide').popover 'hide'
      jQuery('.popovers-toggle').popover 'toggle'
      jQuery('.popovers-destroy').popover 'destroy'
      return

    handleHeader = ->
      #jQuery to collapse the navbar on scroll
      $(window).scroll ->
        if $('.navbar').offset().top > 150
          $('.navbar-fixed-top').addClass 'top-nav-collapse'
        else
          $('.navbar-fixed-top').removeClass 'top-nav-collapse'
        return
      #jQuery for page scrolling feature - requires jQuery Easing plugin
      $ ->
        $('.page-scroll a').bind 'click', (event) ->
          $anchor = $(this)
          $('html, body').stop().animate { scrollTop: $($anchor.attr('href')).offset().top }, 1500, 'easeInOutExpo'
          event.preventDefault()
          return
        return
      #Collapse Navbar When It's Clickicked
      $('.navbar-nav li a, .navbar-brand').click ->
        $('.navbar-collapse.in').collapse 'hide'
        return
      return

    {
      init: ->
        handleHeader()
        handleBootstrap()
        return
      initCounter: ->
        jQuery('.counter').counterUp
          delay: 10
          time: 1000
        return
      initParallaxBg: ->
        $(window).load ->
          console.log 'initParallaxBg'
          jQuery('.parallaxBg').parallax '50%', 0.4
          return
        return

    }

