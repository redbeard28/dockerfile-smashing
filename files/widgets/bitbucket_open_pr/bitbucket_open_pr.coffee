class Dashing.Bitbucket_open_pr extends Dashing.Widget

	@accessor "prs_dev_count", ->
	  @get("projects_devs").length

	@accessor "prs_po_count", ->
	  @get("projects_po").length

	onData: (data) ->
	  	hotcss = switch
	      when data.hotness == "green" then "#00C176"
	      when data.hotness == "default" then "#333"

	    $(@node).css("background-color", hotcss)  