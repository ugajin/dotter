init = () ->
  @scale = 30
  table = $('<table></table>')
  for i in [0..@scale]
    tr = $('<tr></tr>')
    for j in [0..@scale]
      th = $('<th></th>')
      $(tr).append($(th))
    $(table).append($(tr))

  $(table).addClass('table table-bordered')
  $('#dotter').append($(table))


down_mouse = (th) ->
  drawDot(th)
  @mouse_down = true
over_mouse = (th) ->
  if @mouse_down is true
    drawDot(th)
up_mouse = () ->
  @mouse_down = false

drawDot = (th) ->
  if $(th).hasClass('drawed')
    $(th).removeClass('drawed')
  else
    $(th).addClass('drawed')

$ ->
  init()
  $('#dotter table tr th').mousedown ->
    down_mouse(this)
  $('#dotter table th').mouseover ->
    over_mouse(this)
  $('#dotter table th').mouseup ->
    up_mouse()
