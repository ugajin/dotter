@scale = 30

init = () ->
  $('#dotter table').remove()
  table = $('<table></table>')
  for i in [0..@scale/2]
    tr = $('<tr></tr>')
    for j in [0..@scale]
      th = $('<th></th>')
      $(tr).append($(th))
    $(table).append($(tr))

  $(table).addClass('table table-bordered')
  $('#dotter').append($(table))

  th_width = $('th').width()
  $('th').height(th_width)

  $('#dotter th').mousedown ->
    down_mouse(this)
  $('#dotter th').mouseover ->
    over_mouse(this)
  $('#dotter th').mouseup ->
    up_mouse()

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

changeScale = (scale) ->
  console.log "change"
  @scale = scale
  init()

$ ->
  init()
  $('#dotter .scale-10').click ->
    changeScale(10)
  $('#dotter .scale-20').click ->
    changeScale(20)
  $('#dotter .scale-30').click ->
    changeScale(30)
