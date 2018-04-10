class Dashing.Indexation extends Dashing.Widget

  onData: (data) ->
    totalErrors = 0
    totalCriticals = 0

    for daysBack,errors of data.errors
      totalErrors += errors

    for daysBack,criticals of data.criticals
      totalCriticals += criticals

    if totalErrors > 0
      $(@node).addClass("status-danger")
    else
      $(@node).removeClass("status-danger")

    if totalCriticals > 0
      $(@node).removeClass("status-danger")
      $(@node).addClass("status-warning")
    else
      $(@node).removeClass("status-warning")