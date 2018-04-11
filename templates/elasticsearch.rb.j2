# encoding: utf-8

require 'httparty'
require 'json'

countTransformer = lambda do |json|
  count = json["hits"]["total"]
  status = "default"
  if count > 0 && count < 10
    status = "danger"   #danger is orange and warning red, wtf?
  elsif count >= 10
    status = "warning"
  end
  return {:current => count, :status => status}
end

errorsExtractor = lambda do |json|
  items = []
  for hit in json["hits"]["hits"]
    time = Time.parse(hit["_source"]["@timestamp"]).localtime.strftime('%Hh%M')   #correct?
    items.push({label: hit["_source"]["message"][0..50], value: time})
  end
  return {:items => items}
end

queries = {
  :logs_rasalghul_errors => {
    :url => lambda {"{{ elastic_url }}-"+now()+"/_search?search_type=count"},
    :body => JSON.generate({:query => {:bool => {:must => [{:term => {:level => "error"}}]}}}),
    :transformer => countTransformer
  },
  :logs_valinor_errors => {
    :url => lambda {"http://myUrl/valinor-"+now()+"/_search?search_type=count"},
    :body => JSON.generate({:query => {:bool => {:must => [{:term => {:level => "error"}}]}}}),
    :transformer => countTransformer
  },
  :logs_rasalghul_lasts_errors => {
    :url => lambda {"{{ elastic_url }}-"+now()+"/_search"},
    :body => JSON.generate({:query => {:bool => {:must => [{:term => {:level => "error"}}]}}, :size => 10, :sort => [{:@timestamp => {:order => "desc"}}]}),
    :transformer => errorsExtractor
  },
  :logs_valinor_lasts_errors => {
    :url => lambda {"http://myUrl/valinor-"+now()+"/_search"},
    :body => JSON.generate({:query => {:bool => {:must => [{:term => {:level => "error"}}]}}, :size => 10, :sort => [{:@timestamp => {:order => "desc"}}]}),
    :transformer => errorsExtractor
  },
  :depots_lc => {
    :url => lambda {"{{ elastic_url }}-"+now()+"/_search?search_type=count"},
    :body => JSON.generate({:query => {:query_string => {:query => "message:\"PUT /v1/classified/LC/PRO\""}}}),
    :transformer => lambda do |json| {:current => json["hits"]["total"]} end
  }
}


SCHEDULER.every '1m', :first_in => 0 do |job|
  for name, query in queries
    res = HTTParty.post(query[:url].call, :body => query[:body])

    send_event(name, query[:transformer].call(res))
  end
end

def now()
  return Time.now.strftime("%Y.%m.%d")
end
