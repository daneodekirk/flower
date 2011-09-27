doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title "#{@title or 'Untitled'} | A completely plausible website"
    meta(name: 'description', content: @description) if @description?

    link rel: 'stylesheet', href: 'http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css'
    link rel: 'stylesheef', href: 'http://fonts.googleapis.com/css?family=Raleway:100', type:'text/css'
    link rel: 'stylesheef', href: 'app.less', type:'text/css'

  body ->
    div '.container', ->
      div '.content', ->
        img '.flower', src:'flower-1024.jpg', alt:'Petals at my feet'
        h1 '.lynn', 'Lynn Odekirk'
      div '.blank', style:'position:absolute;top:0;left:0;height:100%; width:100%;display:none;background:white;'
      div '.overlay', style:'position:absolute;top:0;left:0;width:40%;height:40%;'

    script src: 'http://code.jquery.com/jquery.min.js'
    script src: 'https://raw.github.com/brandonaaron/jquery-cssHooks/master/bgpos.js'
    script src: 'app.js'
