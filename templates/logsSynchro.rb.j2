# encoding: utf-8

require 'httparty'
require 'json'

def countTotalItemsForQuery(query)

  total = 0
  for i in 0..6
      date = (Time.now - (3600 * 24 * i)).strftime("%Y.%m.%d")

      result = HTTParty.post("http://myUrl/rasalghul-synchro-"+date+"/_search?search_type=count",:body => JSON.generate({:query => {:bool => {:must => [query]}}}))
      total += result["hits"]["total"]
  end

  return total
end

def today()
  today = Time.now.strftime("%Y.%m.%d")
end


def countItems(rootPid)
  json = HTTParty.post("http://myUrl/rasalghul-synchro-"+today()+"/_search",:body => JSON.generate({:query => {:bool => {:must => [{:query_string => {:query => "\"[RECAP] Nombre d'items à traiter :*\""}},{:term => {:root_pid => rootPid}}]}},:size => 1}))

  if json["hits"]["total"] == 0
    return 0
  end
  result = /\[RECAP\]Nombre d'items à traiter :  (\d+)/.match(json["hits"]["hits"][0]["_source"]["message"])
  return result[1]
end

def countUnprocessedItems(rootPid)
  json = HTTParty.post("http://myUrl/rasalghul-synchro-"+today()+"/_search",:body => JSON.generate({:query => {:bool => {:must => [{:query_string => {:query => "\"[METRIQUE] Nbre Unprocessed*\""}},{:term => {:root_pid => rootPid}}]}},:size => 1}))

  if json["hits"]["total"] == 0
    return 0
  end
  result = /\[METRIQUE\] Nbre Unprocessed Item a insérer lors du prochain Run = (\d+)/.match(json["hits"]["hits"][0]["_source"]["message"])
  return result[1]
end

def lastSynchro()
  endLog = HTTParty.post("http://myUrl/rasalghul-synchro-"+today()+"/_search",:body => JSON.generate({:query => {:bool => {:must => [{:term => {:job => "sync_ecriture_metrique_logs"}}]}}, :size => 1, :sort => [{:@timestamp => {:order => "desc"}}]}))
  if endLog["hits"]["total"] == 0
    return {"duration" => "Inconnue","startDate" => "Inconnu"}
  end

  endDate = Time.parse(endLog["hits"]["hits"][0]["_source"]["@timestamp"])
  rootPid = endLog["hits"]["hits"][0]["_source"]["root_pid"].downcase    # Obligé de mettre en lowercase car champ analysé dans ES...

  startLog = HTTParty.post("http://myUrl/rasalghul-synchro-"+today()+"/_search",:body => JSON.generate({:query => {:bool => {:must => [{:term => {:root_pid => rootPid}}]}}, :size => 1}))

  if startLog["hits"]["total"] == 0
    return {"duration" => "Inconnue","startDate" => "Inconnu", "rootPid" => rootPid}
  end

  startDate = Time.parse(startLog["hits"]["hits"][0]["_source"]["@timestamp"])
  duration = "#{(endDate - startDate).to_i}s"

  return {"duration" => duration,"startDate" => startDate.localtime.strftime('%Hh%M'), "rootPid" => rootPid}
end

SCHEDULER.every '10m', :first_in => 0 do |job|
  items = []

  lastSynchro = lastSynchro()
  items.push({label: "Dernière synchro", value: lastSynchro["startDate"]})
  items.push({label: "Durée", value: lastSynchro["duration"]})
  items.push({label: "Items", value: countItems(lastSynchro["rootPid"])})
  items.push({label: "UnprocessedItems", value: countUnprocessedItems(lastSynchro["rootPid"])})
  items.push({label: "Java exception (7j)", value: countTotalItemsForQuery({:query_string => {:query => "Java Exception", :default_operator => "AND", :fields => ["type"]}})})
  items.push({label: "Data truncation (7j)", value: countTotalItemsForQuery({:query_string => {:query => "Data truncation*", :default_operator => "AND"}})})
  items.push({label: "Too many connections (7j)", value: countTotalItemsForQuery({:query_string => {:query => "*Too many connections", :default_operator => "AND"}})})

  send_event("logs_synchro", {:items => items})
end
