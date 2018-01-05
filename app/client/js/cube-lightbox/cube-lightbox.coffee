# // if Meteor.isClient
# // 	(($, window, document) ->
# // 	  'use strict'
# // 	  gridContainer = $('#grid-container')
# // 	  filtersContainer = $('#filters-container')
# // 	  wrap = undefined
# // 	  filtersCallback = undefined

# // 	  ###******************************
# // 	      init cubeportfolio
# // 	  #***************************** 
# // 	  ###

# // 	  gridContainer.cubeportfolio
# // 	    layoutMode: 'grid'
# // 	    rewindNav: true
# // 	    scrollByPage: false
# // 	    mediaQueries: [
# // 	      {
# // 	        width: 1100
# // 	        cols: 3
# // 	      }
# // 	      {
# // 	        width: 800
# // 	        cols: 3
# // 	      }
# // 	      {
# // 	        width: 500
# // 	        cols: 2
# // 	      }
# // 	      {
# // 	        width: 320
# // 	        cols: 1
# // 	      }
# // 	    ]
# // 	    defaultFilter: '*'
# // 	    animationType: 'rotateSides'
# // 	    gapHorizontal: 10
# // 	    gapVertical: 10
# // 	    gridAdjustment: 'responsive'
# // 	    caption: 'overlayBottomPush'
# // 	    displayType: 'sequentially'
# // 	    displayTypeSpeed: 100
# // 	    lightboxDelegate: '.cbp-lightbox'
# // 	    lightboxGallery: true
# // 	    lightboxTitleSrc: 'data-title'
# // 	    lightboxCounter: '<div class="cbp-popup-lightbox-counter">{{current}} of {{total}}</div>'
# // 	    singlePageDelegate: '.cbp-singlePage'
# // 	    singlePageDeeplinking: true
# // 	    singlePageStickyNavigation: true
# // 	    singlePageCounter: '<div class="cbp-popup-singlePage-counter">{{current}} of {{total}}</div>'
# // 	    singlePageCallback: (url, element) ->
# // 	      # to update singlePage content use the following method: this.updateSinglePage(yourContent)
# // 	      return
# // 	    singlePageInlineDelegate: '.cbp-singlePageInline'
# // 	    singlePageInlinePosition: 'below'
# // 	    singlePageInlineInFocus: true
# // 	    singlePageInlineCallback: (url, element) ->
# // 	      # to update singlePageInline content use the following method: this.updateSinglePageInline(yourContent)
# // 	      t = this
# // 	      $.ajax(
# // 	        url: url
# // 	        type: 'GET'
# // 	        dataType: 'html'
# // 	        timeout: 5000).done((result) ->
# // 	        t.updateSinglePageInline result
# // 	        return
# // 	      ).fail ->
# // 	        t.updateSinglePageInline 'Error! Please refresh the page!'
# // 	        return
# // 	      return

# // 	  ###********************************
# // 	      add listener for filters
# // 	  #*******************************
# // 	  ###

# // 	  if filtersContainer.hasClass('cbp-l-filters-dropdown')
# // 	    wrap = filtersContainer.find('.cbp-l-filters-dropdownWrap')
# // 	    wrap.on
# // 	      'mouseover.cbp': ->
# // 	        wrap.addClass 'cbp-l-filters-dropdownWrap-open'
# // 	        return
# // 	      'mouseleave.cbp': ->
# // 	        wrap.removeClass 'cbp-l-filters-dropdownWrap-open'
# // 	        return

# // 	    filtersCallback = (me) ->
# // 	      wrap.find('.cbp-filter-item').removeClass 'cbp-filter-item-active'
# // 	      wrap.find('.cbp-l-filters-dropdownHeader').text me.text()
# // 	      me.addClass 'cbp-filter-item-active'
# // 	      wrap.trigger 'mouseleave.cbp'
# // 	      return

# // 	  else

# // 	    filtersCallback = (me) ->
# // 	      me.addClass('cbp-filter-item-active').siblings().removeClass 'cbp-filter-item-active'
# // 	      return

# // 	  filtersContainer.on 'click.cbp', '.cbp-filter-item', ->
# // 	    me = $(this)
# // 	    if me.hasClass('cbp-filter-item-active')
# // 	      return
# // 	    # get cubeportfolio data and check if is still animating (reposition) the items.
# // 	    if !$.data(gridContainer[0], 'cubeportfolio').isAnimating
# // 	      filtersCallback.call null, me
# // 	    # filter the items
# // 	    gridContainer.cubeportfolio 'filter', me.data('filter'), ->
# // 	    return

# // 	  ###********************************
# // 	      activate counter for filters
# // 	  #*******************************
# // 	  ###

# // 	  gridContainer.cubeportfolio 'showCounter', filtersContainer.find('.cbp-filter-item'), ->
# // 	    # read from url and change filter active
# // 	    match = /#cbpf=(.*?)([#|?&]|$)/gi.exec(location.href)
# // 	    item = undefined
# // 	    if match != null
# // 	      item = filtersContainer.find('.cbp-filter-item').filter('[data-filter="' + match[1] + '"]')
# // 	      if item.length
# // 	        filtersCallback.call null, item
# // 	    return

# // 	  ###********************************
# // 	      add listener for load more
# // 	  #*******************************
# // 	  ###

# // 	  $('.cbp-l-loadMore-button-link').on 'click.cbp', (e) ->
# // 	    e.preventDefault()
# // 	    clicks = undefined
# // 	    me = $(this)
# // 	    oMsg = undefined
# // 	    if me.hasClass('cbp-l-loadMore-button-stop')
# // 	      return
# // 	    # get the number of times the loadMore link has been clicked
# // 	    clicks = $.data(this, 'numberOfClicks')
# // 	    clicks = if clicks then ++clicks else 1
# // 	    $.data this, 'numberOfClicks', clicks
# // 	    # set loading status
# // 	    oMsg = me.text()
# // 	    me.text 'LOADING...'
# // 	    # perform ajax request
# // 	    $.ajax(
# // 	      url: me.attr('href')
# // 	      type: 'GET'
# // 	      dataType: 'HTML').done((result) ->
# // 	      items = undefined
# // 	      itemsNext = undefined
# // 	      # find current container
# // 	      items = $(result).filter(->
# // 	        $(this).is 'div' + '.cbp-loadMore-block' + clicks
# // 	      )
# // 	      gridContainer.cubeportfolio 'appendItems', items.html(), ->
# // 	        # put the original message back
# // 	        me.text oMsg
# // 	        # check if we have more works
# // 	        itemsNext = $(result).filter(->
# // 	          $(this).is 'div' + '.cbp-loadMore-block' + clicks + 1
# // 	        )
# // 	        if itemsNext.length == 0
# // 	          me.text 'NO MORE WORKS'
# // 	          me.addClass 'cbp-l-loadMore-button-stop'
# // 	        return
# // 	      return
# // 	    ).fail ->
# // 	      # error
# // 	      return
# // 	    return
# // 	  return
# // 	) jQuery, window, document
