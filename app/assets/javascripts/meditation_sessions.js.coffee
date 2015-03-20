# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

### SHOW HIDE REGISTRATION BOXES ###
$('#log-in-box, #sign-up-box').css('display','none')
$('#log-in-button').on 'click', (e) ->
  e.preventDefault()
  $('#sign-up-box').css('display','none')
  $('#log-in-box').css('display','block')
  return

$('#sign-up-button').on 'click', (e) ->
  e.preventDefault()
  $('#log-in-box').css('display','none')
  $('#sign-up-box').css('display','block')
  return

### MEDITATION TIMER ###
timer = null
interval = 1000
second = 0
minute = 0
element = document.getElementById('duration')
element.innerHTML = '<header id="minutes"></header>'
textElement = document.getElementById('minutes')
meditationDuration = new (ProgressBar.Circle)(element,
    duration: 200
    strokeWidth: 2
    trailWidth: 0.5
    color: '#FCB03C'
    trailColor: '#ddd')
$('#start').click ->
    $('#complete').css('display','none')
    if timer != null
        return
    timer = setInterval (->
        ++second
        meditationDuration.animate second / 60, ->
            if second > 59
                ++minute
                second = 0
                $('#complete #time_duration').text(minute + " Minutes")
                $('#time_spent').attr("value",minute)
            textElement.innerHTML = minute
            return
        return
    ), interval
    return
$('#pause').click ->
    clearInterval timer
    timer = null
    duration = $('#time_spent').attr('value');
    $('#session_comments, #comments').hide()
    if duration >= 1
        $('#session_comments, #comments').show()
    $('#complete').css('display','block')
return