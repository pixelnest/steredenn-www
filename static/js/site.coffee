---
---
$ ->

  # -------------------------------------------------------
  # Lightboxes.
  # -------------------------------------------------------

  $('.gallery').magnificPopup
    type:'image'
    delegate: 'a'
    closeOnContentClick: true

    mainClass: 'mfp-with-zoom mfp-img-mobile'

    # Enable gallery, preload and hide counter.
    gallery:
      enabled: true
      preload: [0, 2]
      tCounter: ''

    zoom:
      enabled: true
      duration: 300
      opener: (element) ->
        return element.find('img')

  # -------------------------------------------------------
  # Stars background.
  # -------------------------------------------------------

  if (document.getCSSCanvasContext)
    doBigBang()
  else
    doFakeBigBang()

# Public: Create a CSS canvas that pops stars out of nowhere.
# Returns nothing.
doBigBang = ->

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

  # Context.
  context = document.getCSSCanvasContext('2d', 'animation', width, height)

  # Draw!
  for i in [0..width]
    for j in [0..height]

      # Have the right to create a star?
      if canCreateStar()
        # Get the color and size.
        context.fillStyle = getColor()
        s = getSize()

        context.fillRect(i, j, s, s)

# Public: Create a fake background for restricted browsers (hello, Firefox & IE!).
# Returns nothing.
doFakeBigBang = ->
  $(document.body).css('background-image', 'url("/static/images/fake_background.png")');
