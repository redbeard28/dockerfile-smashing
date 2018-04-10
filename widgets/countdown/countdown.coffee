class Dashing.Countdown extends Dashing.Widget

  @accessor "title", ->
    "Fin du "+@get('name')

  endMoment: ->
    moment(@get("endDate"), "DD/MMMM/YY H:m A")

  @accessor "formattedEndDate", ->
    @endMoment().format("ddd D MMM YYYY")

  ready: ->
    @startCountdown()
    setInterval(@startCountdown, 60000)

  startCountdown: =>
    currentMoment = moment()

    current_day = moment().startOf("day")
    end_day = @endMoment().startOf("day")

    if current_day.isSame(end_day)
      @set('timeleft', "! AUJOURD'HUI !")
      $(@node).fadeTo('fast', 0.8).fadeTo('fast', 1.0)
    else
      @set('timeleft', currentMoment.to(@endMoment()))