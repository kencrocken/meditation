# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

timer = null
interval = 1000
second = 0
minute = 0
element = $('#duration')
element.innerHTML = '<header id="minutes"></header>'
textElement = $('#minutes')
meditationDuration = new (ProgressBar.Circle)(element,
    duration: 200
    strokeWidth: 2
    trailWidth: 1
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