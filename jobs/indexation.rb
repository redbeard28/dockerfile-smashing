# encoding: utf-8

require 'httparty'
require 'json'

@response = {:errors => {}, :criticals => {}, :status => ""}

def formatErrorResponse(numberDaysBack, errorsCount)
  return {'errors' => {numberDaysBack.to_s => errorsCount}}
end

def countCriticalsIndexationError(numberDaysBack)
  query = JSON.generate({:query =>
                             {:bool =>
                                  {:must => [{:query_string => {:query => "message:\"L'indexation a pris fin prématurément. Toutes les annonces n'ont pas pu être indéxées. Rejouez l'indexation\""}}]
                                  }
                             }
                        })
  date = (Time.now - (3600 * 24 * numberDaysBack)).strftime("%Y.%m.%d")
  url = "http://myUrl/rasalghul-"+date+"/_search?search_type=count"
  json = HTTParty.post(url, :body => query)
  return json["hits"]["total"]
end

def countErrorsByDay(numberDaysBack)
  query = JSON.generate({:query =>
                                   {:bool =>
                                        {:must => [{:query_string => {:query => "message:\"Impossible d'indexer l'annonce\""}}]
                                        }
                                   }
                              })
  date = (Time.now - (3600 * 24 * numberDaysBack)).strftime("%Y.%m.%d")
  url = "http://myUrl/rasalghul-"+date+"/_search?search_type=count"
  json = HTTParty.post(url, :body => query)
  return json["hits"]["total"]
end

def statusParser(json)
  indexationRunning = json["hits"]["total"] > 0
  if !indexationRunning
    return "Pas d'indexation en cours"
  end
  result = /Indexation à \[(.*)\] pour un total de (\w+) annonces trouvées./.match(json["hits"]["hits"][0]["_source"]["message"])
  if result[2].to_i > 100
    return result[1]
  else
    return "Pas d'indexation en cours"
  end
end

def getStatus()
  now = Time.now.strftime("%Y.%m.%d")
  url = "http://myUrl/rasalghul-"+now+"/_search"
  query = JSON.generate({:query => {:bool => {:must => [{:query_string => {:query => "message:\"Indexation à\""}}]}}, :size => 1, :sort => [{:@timestamp => {:order => "desc"}}]})
  json = HTTParty.post(url, :body => query)
  return statusParser(json)
end

def countCriticalsForDaysBack(numberDaysBack)
  criticals = {}
  for day in 0..numberDaysBack
    count = countCriticalsIndexationError(day)
    criticals[day.to_s] = count
  end
  return criticals
end

def countErrorsForDaysBack(numberDaysBack)
  errors = {}
  for day in 0..numberDaysBack
    count = countErrorsByDay(day)
    errors[day.to_s] = count
  end
  return errors
end

def reInitResponse()
  numberDaysBack = 3
  errors = countErrorsForDaysBack(numberDaysBack)
  criticals = countCriticalsForDaysBack(numberDaysBack)
  status = getStatus()
  @response[:errors] = errors
  @response[:criticals] = criticals
  @response[:status] = status
  return @response.clone
end

def updateResponse()
  errors = countErrorsForDaysBack(0)
  criticals = countCriticalsForDaysBack(0)
  status = getStatus()
  @response[:errors]['0'] = errors['0']
  @response[:criticals]['0'] = criticals['0']
  @response[:status] = status
  return @response.clone
end

SCHEDULER.in '0s' do |job|
  resp = reInitResponse()
  send_event("indexation", resp)
end

SCHEDULER.cron '0 6 * * *' do |job|
  resp = reInitResponse()
  send_event("indexation", resp)
end

SCHEDULER.every '5m', :first_in => '5m' do |job|
  resp = updateResponse()
  send_event("indexation", resp)
end