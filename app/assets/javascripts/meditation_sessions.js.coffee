# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

timer = null
interval = 1000
duration = parseInt($('#duration').text())
value = duration

$('#start').click ->
    $('#complete').css('display','none')
    if timer != null
      return
    timer = setInterval((->
        
        if value > 0
            $('#duration').text --value
            timeCompleted = duration - value
            $('#complete label').text(timeCompleted + " Minutes")
            $('#time_spent').attr("value",timeCompleted)
            return
        else
            clearInterval timer
            $('#duration').text "complete"
            $('#complete').css('display','block')
            
    ), interval)
    return
$('#pause').click ->
    clearInterval timer
    timer = null
    $('#complete').css('display','block')
return

