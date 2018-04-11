#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'

DFS_URL = '{{ hdfs_url }}'

#----------------------------------------------------------------------------------------------------
def get_dfs_stats()
dfs_stats=Hash.new
name=Array.new
value=Array.new
i=0

page = Nokogiri::HTML(open("#{DFS_URL}"))

page.css('div.dfstable tr td#col1').each do |el|
        name[i]=el.text.strip.tr(' ','_') # this will also replace space with _
        i=i+1
        end

j=0
page.css('div.dfstable tr td#col3').each do |el|
        el=el.text.strip
        el=el.sub(/Decommissioned: \d*/,'') # I am not intrested in Decommissioned number
        value[j]=el.split
        j=j+1
        end

name.zip(value).each do |n,v|
        dfs_stats[n]=v
        end

dfs_stats.delete("") # Because "DataNodes usages"=>["Min", "%"], ""=>["7.49", "%"]
dfs_stats.delete("DataNodes_usages")

return dfs_stats
end
#----------------------------------------------------------------------------------------------------
SCHEDULER.every '1m' do
begin

        dfs_stats=Hash.new
        dfs_stats=get_dfs_stats()
        dfs_stats.each do |key,value|
                send_event( key.to_s, { current: value[0],moreinfo: value[1] })
                sleep 2 # this will give nice effect in UI
                end
end
end
#----------------------------------------------------------------------------------------------------
#Below are the widget_event_id it will send to Dashbord
#Configured_Capacity
#DFS_Used
#Non_DFS_Used
#DFS_Remaining
#DFS_Used%
#DFS_Remaining%
#Block_Pool_Used
#Block_Pool_Used%
#Live_Nodes
#Dead_Nodes
#Decommissioning_Nodes
#----------------------------------------------------------------------------------------------------
