App.Votes =

  hoverize: (votes) ->
    $(document).on {
      'mouseenter focus': ->
        $("div.participation-not-allowed", this).show();
        $("div.participation-allowed", this).hide();
      mouseleave: ->
        $("div.participation-not-allowed", this).hide();
        $("div.participation-allowed", this).show();
    }, votes

  hide_button: ->
    $('.button-support').click ->
      # Se oculta el botón de 'apoyar'
      $(this).hide()
      console.log($(this))
      # Se debe sumar +1 al conteo de apoyos
      console.log($(this).parent().parent().siblings().first().children(".counter"))
      element = $(this).parent().parent().siblings().first().children(".counter")
      console.log(element)
      count = (parseInt(element.text()) + 1)
      console.log(count)
      element.replaceWith('<span class="counter">' + count + "</span>")
      $(this).remove()
      return

  initialize: ->
    App.Votes.hoverize "div.votes"
    App.Votes.hoverize "div.supports"
    App.Votes.hide_button ""
    false
