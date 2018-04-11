require 'httparty'
require 'json'

SCHEDULER.every '10m', :first_in => 0 do |job|
  #Retrieve Data
  auth = {:username => "", :password => ""}
  url = "https://support.carboatmedia.fr/rest/greenhopper/latest/xboard/work/allData?rapidViewId=14"
  res = HTTParty.get(url, :basic_auth => auth)

  #Manipulate Data
  sprintData = res["sprintsData"]["sprints"][0]
  name = sprintData["name"]
  endDate = sprintData["endDate"]

  #Send Data
  send_event('sprint_end', {name:name, endDate:endDate})
end

