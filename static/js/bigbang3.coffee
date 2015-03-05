---
---

$ ->

  # Canvas.
  canvas = $('#universe')
  canvas.prop 'width', $(window).width()
  canvas.prop 'height', $(window).height()

  # Execute big bang.
  if (canvas.get 0)
    doBigBang canvas.get(0).getContext('2d')

  # Open link.
  $('#open').prop 'href', canvas.get(0).toDataURL('image/png')

# Public: Create a CSS canvas that pops stars out of nowhere.
# Returns nothing.
doBigBang = (context) ->
  paintFirstLayer(context)
  paintSecondLayer(context)
  paintThirdLayer(context)

paintFirstLayer = (context) ->

  DENSITY_TABLE = {
    5:  1000
    15: 2500
    80: 5000
  }

  COLOR_TABLE = {
    1: 'rgba(255, 251, 145, 0.5)'
    9: 'rgba(255, 172, 143, 0.5)'
    20: 'rgba(255, 255, 255, 0.5)'
    70: 'rgba(201, 201, 201, 0.5)'
  }

  SIZE_TABLE = {
    1:  5
    3:  4
    6:  3
    20: 2
    70: 1
  }

  # Get the density.
  density = exports.roll(DENSITY_TABLE)

  # Factories.
  canCreateStar = -> exports.randomBetween(0, density) == 0
  getColor = -> exports.roll(COLOR_TABLE)
  getSize = -> exports.roll(SIZE_TABLE)

  # Current window size.
  width = $(window).width()
  height = $(window).height()

  # Draw!
  for i in [0..width]
    for j in [0..height]

      # Have the right to create a star?
      if canCreateStar()
        # Get the color and size.
        context.fillStyle = getColor()
        s = getSize()

        context.fillRect(i, j, s, s)

paintSecondLayer = (context) ->
  DENSITY_TABLE = {
    5:  1000
    15: 2500
    80: 5000
  }

  COLOR_TABLE = {
    1: '#fffd7f'
    9: '#ff9a7d'
    20: '#fff'
    70: '#bdbdbd'
  }

  SIZE_TABLE = {
    1:  5
    3:  4
    6:  3
    20: 2
    70: 1
  }

  # Get the density.
  density = exports.roll(DENSITY_TABLE)

  # Factories.
  canCreateStar = -> exports.randomBetween(0, density) == 0
  getColor = -> exports.roll(COLOR_TABLE)
  getSize = -> exports.roll(SIZE_TABLE)

  # Current window size.
  width = $(window).width()
  height = $(window).height()

  # Draw!
  for i in [0..width]
    for j in [0..height]

      # Have the right to create a star?
      if canCreateStar()
        s = getSize()

        # context.fillStyle = 'rgba(255, 255, 255, 0.1)'
        # context.fillRect(i - 3, j - 3, s + 6, s + 6)

        context.fillStyle = 'rgba(255, 255, 255, 0.1)'
        context.fillRect(i - 1, j - 1, s + 2, s + 2)

        # Get the color and size.
        context.fillStyle = getColor()

        context.fillRect(i, j, s, s)

paintThirdLayer = (context) ->

  DENSITY_TABLE = {
    50: 10000
    50: 20000
  }

  COLOR_TABLE = {
    1: 'rgba(255, 251, 145, 1)'
    9: 'rgba(255, 172, 143, 1)'
    20: 'rgba(255, 255, 255, 1)'
    70: 'rgba(201, 201, 201, 1)'
  }

  # Get the density.
  density = exports.roll(DENSITY_TABLE)

  # Factories.
  canCreateStar = -> exports.randomBetween(0, density) == 0
  getColor = -> exports.roll(COLOR_TABLE)

  # Current window size.
  width = $(window).width()
  height = $(window).height()

  # Draw!
  for i in [0..width]
    for j in [0..height]

      # Have the right to create a star?
      if canCreateStar()
        color = getColor()

        grd = context.createRadialGradient(i, j, 0, i, j, 10)
        grd.addColorStop(0, convertColor(color, 0.5))
        grd.addColorStop(1, 'rgba(23, 23, 23, 0)')

        context.fillStyle = grd
        context.fillRect(i - 10, j - 10, Math.PI*10, Math.PI*10)

        # Get the color and size.
        context.fillStyle = color
        s = 4


        context.fillRect(i-2, j-2, s, s)

convertColor = (color, alpha) ->
  newColor = color.substr(0, color.lastIndexOf(','))
  newColor += ', ' + alpha + ')'
  newColor

