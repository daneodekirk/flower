doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title "#{@title or 'Untitled'} | A completely plausible website"
    meta(name: 'description', content: @description) if @description?

    link rel: 'stylesheet', href: 'http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css'

    style '''
      img {display:block;margin:0 auto;}
    '''

  body ->
    div '.container', ->
      div '.content', ->
        img src:'flower-1024.jpg', alt:'Petals at my feet'
        h1 @title or 'Hello World'

    script src: 'http://code.jquery.com/jquery.min.js'
