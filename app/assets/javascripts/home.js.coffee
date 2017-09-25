App.Home =
  jumbotron: ->
    alert("This is Home")

$(document).on 'turbolinks:load', ->
  return unless $('.home.index').length > 0
  $('.jumbotron').on 'click', ->
    App.Home.jumbotron()
