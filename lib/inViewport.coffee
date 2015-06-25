###*
# @author  Mudit Ameta
# @license https://github.com/zeusdeux/isInViewport/blob/master/license.md MIT
###

(($, window) ->
  # polyfilling trim for ie < 9. sigh ;-;
  #gets the width of the scrollbar

  getScrollbarWidth = (viewport) ->
    scrollBarWidth = undefined
    #append a div that has 100% width to get true width of viewport
    el = $('<div></div>').css('width': '100%')
    viewport.append el
    #subtract true width from the viewport width which is inclusive
    #of scrollbar by default
    scrollBarWidth = viewport.width() - el.width()
    #remove our element from DOM
    el.remove()
    scrollBarWidth

  isInViewport = (element, options) ->
    boundingRect = element.getBoundingClientRect()
    top = boundingRect.top
    bottom = boundingRect.bottom
    left = boundingRect.left
    right = boundingRect.right
    settings = $.extend({
      'tolerance': 0
      'viewport': window
    }, options)
    isVisibleFlag = false
    $viewport = if settings.viewport.jquery then settings.viewport else $(settings.viewport)
    if !$viewport.length
      console.warn 'isInViewport: The viewport selector you have provided matches no element on page.'
      console.warn 'isInViewport: Defaulting to viewport as window'
      $viewport = $(window)
    $viewportHeight = $viewport.height()
    $viewportWidth = $viewport.width()
    typeofViewport = $viewport.get(0).toString()
    #if the viewport is other than window recalculate the top,
    #bottom,left and right wrt the new viewport
    #the [object DOMWindow] check is for window object type in PhantomJS
    if $viewport[0] != window and typeofViewport != '[object Window]' and typeofViewport != '[object DOMWindow]'
      # Use getBoundingClientRect() instead of $.Offset()
      # since the original top/bottom positions are calculated relative to browser viewport and not document
      viewportRect = $viewport.get(0).getBoundingClientRect()
      #recalculate these relative to viewport
      top = top - (viewportRect.top)
      bottom = bottom - (viewportRect.top)
      left = left - (viewportRect.left)
      right = right - (viewportRect.left)
      #get the scrollbar width from cache or calculate it
      isInViewport.scrollBarWidth = isInViewport.scrollBarWidth or getScrollbarWidth($viewport)
      #remove the width of the scrollbar from the viewport width
      $viewportWidth -= isInViewport.scrollBarWidth
    #handle falsy, non-number and non-integer tolerance value
    #same as checking using isNaN and then setting to 0
    #bitwise operators deserve some love too you know
    settings.tolerance = ~ ~Math.round(parseFloat(settings.tolerance))
    if settings.tolerance < 0
      settings.tolerance = $viewportHeight + settings.tolerance
    #viewport height - tol
    #the element is NOT in viewport iff it is completely out of
    #viewport laterally or if it is completely out of the tolerance
    #region. Therefore, if it is partially in view then it is considered
    #to be in the viewport and hence true is returned. Because we have adjusted
    #the left/right positions relative to the viewport, we should check the
    #element's right against the viewport's 0 (left side), and the element's
    #left against the viewport's width to see if it is outside of the viewport.
    if right <= 0 or left >= $viewportWidth
      return isVisibleFlag
    #if the element is bound to some tolerance
    isVisibleFlag = if settings.tolerance then ! !(top <= settings.tolerance and bottom >= settings.tolerance) else ! !(bottom > 0 and top <= $viewportHeight)
    isVisibleFlag

  if !String::hasOwnProperty('trim')

    String::trim = ->
      @replace /^\s*(.*?)\s*$/, '$1'

  #lets you chain any arbitrary function or an array of functions and returns a jquery object

  run = (args) ->
    if arguments.length == 1 and typeof args == 'function'
      args = [ args ]
    if !(args instanceof Array)
      throw new SyntaxError('isInViewport: Argument(s) passed to .do/.run should be a function or an array of functions')
    i = 0
    while i < args.length
      if typeof args[i] != 'function'
        console.warn 'isInViewport: Argument(s) passed to .do/.run should be a function or an array of functions'
        console.warn 'isInViewport: Ignoring non-function values in array and moving on'
        i++
        continue
      j = 0
      while j < @length
        args[i].call $(@[j])
        j++
      i++
    this

  #do is a reserved word and hence using it as a property throws on some browsers
  #it is now aliased as $.fn.run

  $.fn['do'] = (args) ->
    console.warn 'isInViewport: .do causes issues in IE and some browsers since its a reserved. Use $.fn.run instead i.e., $(el).run(fn).'
    run args

  $.fn.run = run
  $.extend $.expr[':'], 'in-viewport': (currObj, index, meta) ->
    if ! !meta[3]
      args = meta[3].split(',')
      #when user only gives viewport and no tolerance
      if args.length == 1 and isNaN(args[0])
        args[1] = args[0]
        args[0] = undefined
      isInViewport currObj,
        tolerance: if args[0] then args[0].trim() else undefined
        viewport: if args[1] then args[1].trim() else undefined
    else
      isInViewport currObj
  return
) jQuery, window

# ---
# generated by js2coffee 2.0.4