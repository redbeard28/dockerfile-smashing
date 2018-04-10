class Dashing.Its_friday extends Dashing.Widget

  ready: ->
    self = this;
    self.setCss(self.isItTheDay())

    setInterval ->
      self.setCss(self.isItTheDay())
     , self.millisToMidnight()

  setCss: (itsTheDay) ->
    if(itsTheDay)
      $(@node).css("visibility", "visible")
    else
      $(@node).css("visibility", "hidden")

  isItTheDay: ->
    new Date().getDay() == 5

  millisToMidnight: ->
    return new Date().setHours(24,0,0,0) - new Date();