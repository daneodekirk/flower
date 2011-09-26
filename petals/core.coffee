$(window).load () ->
  $('img').bind 'click', () ->
    $('.blank').fadeIn 1000, () ->
      zoom = $('.overlay')
      width = zoom.width()/2
      height = zoom.height()/2
      dim = 'height':$(window).height(), 'width':$(window).width()
      $(document).bind 'mousemove', (e) ->
        zoom.fadeIn 400
        x = e.pageX - width
        y = e.pageY - height
        bgx = ( 100*x / dim.width ) + 25
        bgy = ( 100*y / dim.height ) + 25
        zoom.css 'top':y,'left':x, 'backgroundPositionY':"#{bgy}%", 'backgroundPositionX':"#{bgx}%"

  $('.overlay').bind 'click', () ->
    $(document).unbind 'mousemove'
    $(this).fadeOut 400
    $('.blank').fadeOut 400
