#!/usr/bin/env ruby

# file: job_log.rb

require 'sps-sub'
require 'dynarex'


class JobLog

  def initialize(dxfilepath='joblog.xml', host: 'sps2', port: 59100)

    @dxfilepath = dxfilepath
    @sps = SPSSub.new host: host, port: port    
    
    @dx = if File.exists? dxfilepath then      
      Dynarex.new(dxfilepath)
    else
      Dynarex.new 'jobs/job(title, desc, started, ended, status, tags)'
    end
  end

  def listen

    topics = %w(started done aborted).map {|x| "log/+/#{x}/+"}.join(' | ')
    @sps.subscribe(topic: topics) do |msg, topic|

      title = topic[/(?<=log\/)\w+/]

      case topic
      when /\/started\//

        desc, raw_tags = msg.split(/(?= +#)/,2)
        tags = raw_tags.scan(/(?<=#)\w+/).join ' '
        @dx.create title: title, started: Time.now.to_s, desc: desc, tags: tags

      when /\/done\//

        r = @dx.find_by_title title
        r.ended = Time.now.to_s if r
        r.status = 'success'

      when /\/aborted\//

        r = @dx.find_by_title title
        r.ended = Time.now.to_s if r
        r.status = msg
      end

      # write the entry to file
      @dx.save @dxfilepath
    end
  end
end


if __FILE__ == $0 then
  jl = JobLog.new
  jl.listen
end
