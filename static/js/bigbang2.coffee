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
