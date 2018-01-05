@OwlCarousel = do ->
  { initOwlCarousel: ->
    console.log 'init owl'
    #Owl Slider v1
    $('.owl-slider').owlCarousel
      itemsDesktop: [1000,5]
      itemsDesktopSmall: [900, 4]
      itemsTablet: [600,3]
      itemsMobile: [479,2]
    # Custom Navigation Events
    $('.next-v1').click ->
      owl.trigger 'owl.next'
      return
    $('.prev-v1').click ->
      owl.trigger 'owl.prev'
      return
    #Owl Slider v2
    $('.owl-slider-v2').owlCarousel
      itemsDesktop: [1000,5]
      itemsDesktopSmall: [900,4]
      itemsTablet: [600,3]
      itemsMobile: [479,2]
      slideSpeed: 1000
    # Custom Navigation Events
    $('.next-v2').click ->
      owl.trigger 'owl.next'
      return
    $('.prev-v2').click ->
      owl.trigger 'owl.prev'
      return
    #Owl Slider v3
    $('.owl-slider-v3').owlCarousel
      items: 9
      autoPlay: 5000
      itemsDesktop:[1000,5]
      itemsDesktopSmall:[900,4]
      itemsTablet:[600,3]
      itemsMobile:[300,2]
    #Owl Slider v4
    $('.owl-slider-v4').owlCarousel
      items: 3
      itemsDesktop:[1000,3]
      itemsTablet:[600,2]
      itemsMobile:[479,1]
    #Owl Testimonials v1
    $('.owl-ts-v1').owlCarousel
      slideSpeed: 600
      singleItem: true
      navigation: true
      navigationText: ['','']
    #Owl Clients v2
    $('.owl-clients-v2').owlCarousel
      items: 5
      autoPlay: 10000
      itemsDesktop:[1000,5]
      itemsDesktopSmall:[900,4]
      itemsTablet:[600,3]
      itemsMobile:[479,1]
    $('.owl-item').owlCarousel
      items: 5
      autoPlay: 10000
      itemsDesktop:[1000,5]
      itemsDesktopSmall:[900,4]
      itemsTablet:[600,3]
      itemsMobile:[479,1]
    return
 }

# ---
# generated by js2coffee 2.0.4