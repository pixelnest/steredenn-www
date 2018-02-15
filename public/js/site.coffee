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
