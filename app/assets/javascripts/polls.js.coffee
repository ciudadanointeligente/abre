App.Polls =

  vote: ->
    $('.vote-question').click ->
      container = $(this).closest(".poll-question").siblings().children(".answer-container")
      container.replaceWith('<div class="poll-question-answers"><div class="share-supported"> <div class="bg-gray padding"> <span>Ya has votado en esta votación</span></div></div></div>')
      return

  initialize: ->
    App.Polls.vote ""
    false
