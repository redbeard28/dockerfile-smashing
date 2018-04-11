# encoding: utf-8

require 'httparty'
require 'json'

SCHEDULER.every '2m', :first_in => 0 do |job|

	auth = {:username => "", :password => ""}
	url_jira = "{{ jira_api_url }}"

	issues = getBlockedIssues(url_jira, auth)
	send_event(:jira_blocked_issues, issues: issues, hotness: getBackgroundColorByNBIssues(issues))
end

def getBlockedIssues(url_jira, auth)
	jql = '(project=OWI AND status="A recetter" AND indicateur is not EMPTY)'
	url = url_jira+ERB::Util.url_encode(jql) 

	res = HTTParty.get(url, :basic_auth => auth)
	
	issues = []
	res["issues"].to_a.each do |issue|		
		infos_issue = HTTParty.get(issue["self"], :basic_auth => auth)

		ticket_key = infos_issue["key"]
		ticket_name = infos_issue["fields"]["summary"]
		ticket_dev = infos_issue["fields"]["assignee"]["name"]
		
		issues.push({name: ticket_name, infos: ticket_dev +" | "+ ticket_key, widget_class: "late"})
	end

	return issues
end

def getBackgroundColorByNBIssues(items)
	hotness = "green"
	if items.length >= 1
		hotness = "default"
	end
	return hotness
end