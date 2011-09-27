(function() {
  $(window).load(function() {
    $('img').bind('click', function() {
      return $('.blank').fadeIn(1000, function() {
        var dim, height, width, zoom;
        zoom = $('.overlay');
        width = zoom.width() / 2;
        height = zoom.height() / 2;
        dim = {
          'height': $(window).height(),
          'width': $(window).width()
        };
        return $(document).bind('mousemove', function(e) {
          var bgx, bgy, x, y;
          zoom.fadeIn(400);
          x = e.pageX - width;
          y = e.pageY - height;
          bgx = (100 * x / dim.width) + 25;
          bgy = (100 * y / dim.height) + 25;
          return zoom.css({
            'top': y,
            'left': x,
            'backgroundPositionY': "" + bgy + "%",
            'backgroundPositionX': "" + bgx + "%"
          });
        });
      });
    });
    return $('.overlay').bind('click', function() {
      $(document).unbind('mousemove');
      $(this).fadeOut(400);
      return $('.blank').fadeOut(400);
    });
  });
}).call(this);
