# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  $('#add_comic_btn').click ->
    console.log "add_modal"
    $('#add_comic_modal1').modal()
    $('#add_comic_step1').addClass("stepwizard-current-step")
