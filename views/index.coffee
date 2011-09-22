doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title "#{@title or 'Untitled'} | A completely plausible website"
    meta(name: 'description', content: @description) if @description?

    script src: 'http://code.jquery.com/jquery.min.js'
    link rel: 'stylesheet', href: '/css/app.css'

  body ->
    header ->
      h1 @title or 'Hello World'
