class Dashing.Jira extends Dashing.Widget

	onData: (data) ->
	  	hotcss = switch
	      when data.hotness == "green" then "#00C176"
	      when data.hotness == "default" then "#333"

	    $(@node).css("background-color", hotcss)  