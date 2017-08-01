App.Polls =

  vote: ->
    $('.vote-question').click ->
      console.log("HAz clicjeado el boton")
      console.log(this)
      $(this).hide()
      element = $(this).closest(".row").siblings().children(".total-votes-text").children(".total-votes-count")
      count = (parseInt(element.text()) + 1)
      element.replaceWith('<span class="total-votes-count">' + count + "</span>")
      $(this).remove()
      return

  initialize: ->
    console.log("ENTRADO A INITIAILIZE")
    App.Polls.vote ""
    false
