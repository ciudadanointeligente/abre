App.Votes =

  hide_button: ->
    $('.button-support').click ->
      # Se oculta el botón de 'apoyar'
      $(this).hide()
      # Se debe sumar +1 al conteo de apoyos
      element = $(this).parent().parent().parent().siblings().first().children(".counter")
      count = (parseInt(element.text()) + 1)
      element.replaceWith('<span class="counter">' + count + "</span>")
      $(this).remove()
      return

  hoverize_support: (votes) ->
    $(document).on {
      'mouseenter focus': ->
        $("div.js-support-not-allowed", this).show();
        $("div.js-support-allowed", this).hide();
      mouseleave: ->
        $("div.js-support-not-allowed", this).hide();
        $("div.js-support-allowed", this).show();
    }, votes

  initialize: ->
    App.Votes.hoverize_support 'div.js-support'
    App.Votes.hide_button ""
    false
