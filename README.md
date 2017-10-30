# Introducing the job_log gem

## Usage

    require 'job_log'

    jl = JobLog.new
    jl.listen

The job_log gem subscribes to the following topics:

* log/+/started/+
* log/+/done/+
* log/+/aborted/+

Entries are save into the the Dynarex file job_log.xml.

## Testing

    require 'spspub_log'

    sps = SPSPubLog.new host: 'sps2', port: 59100
    sps.info 'frt/started: Fetches the remaining bank balance. #bank #balance'

    sleep 3

    sps.info 'frt/done: bye'

## Output 

file: job_log.xml

<pre>
&lt;?xml version='1.0' encoding='UTF-8'?&gt;
&lt;jobs&gt;
  &lt;summary&gt;
    &lt;recordx_type&gt;dynarex&lt;/recordx_type&gt;
    &lt;format_mask&gt;[!title] [!desc] [!started] [!ended] [!status] [!tags]&lt;/format_mask&gt;
    &lt;schema&gt;jobs/job(title, desc, started, ended, status, tags)&lt;/schema&gt;
    &lt;default_key&gt;title&lt;/default_key&gt;
  &lt;/summary&gt;
  &lt;records&gt;
    &lt;job id='1' created='2017-10-30 11:39:34 +0000' last_modified='2017-10-30 11:39:37 +0000'&gt;
      &lt;title&gt;frt&lt;/title&gt;
      &lt;desc&gt;Fetches the remaining bank balance.&lt;/desc&gt;
      &lt;started&gt;2017-10-30 11:39:34 +0000&lt;/started&gt;
      &lt;ended&gt;2017-10-30 11:39:37 +0000&lt;/ended&gt;
      &lt;status&gt;success&lt;/status&gt;
      &lt;tags&gt;bank balance&lt;/tags&gt;
    &lt;/job&gt;
  &lt;/records&gt;
&lt;/jobs&gt;
</pre>

## Resources

* job_log https://rubygems.org/gems/job_log

joblog job_log gem job log spspublog sps
