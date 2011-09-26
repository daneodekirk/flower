doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title "#{@title or 'Untitled'} | A completely plausible website"
    meta(name: 'description', content: @description) if @description?

    link rel: 'stylesheet', href: 'http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css'

    style '''
      html,body {margin:0;padding:0;width:100%;height:100%;}
      /*body {background: url(flower-1024.jpg) no-repeat center 5%;}*/
      img {display:block;margin:0 auto; margin-top:2%;}
      .container {height:100%}
      .content {position:relative;}
      h1 { position:absolute; left:60%;}
      .overlay{ background: url(flower-full.jpg) no-repeat 17% 13%;display:none;}
    '''

  body ->
    div '.container', ->
      div '.content', ->
        img src:'flower-1024.jpg', alt:'Petals at my feet'
        h1 @title or 'Hello World'
      div '.overlay', style:'position:absolute;top:0;left:0;width:50%;height:50%;'

    script src: 'http://code.jquery.com/jquery.min.js'
    script src: 'https://raw.github.com/brandonaaron/jquery-cssHooks/master/bgpos.js'

    coffeescript ->
      $(window).load () ->
        $('img').bind 'click', () ->
          zoom = $('.overlay')
          width = zoom.width()/2
          height = zoom.height()/2
          dim = 'height':$(window).height(), 'width':$(window).width()
          $(document).bind 'mousemove', (e) ->
            zoom.fadeIn 200
            x = e.pageX - width
            y = e.pageY - height
            bgx = ( 100*x / dim.width ) + 30
            bgy = ( 100*y / dim.height ) + 30
            console.log y/dim.height
            zoom.css 'top':y,'left':x, 'backgroundPositionY':"#{bgy}%", 'backgroundPositionX':"#{bgx}%"



        
