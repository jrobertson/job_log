Gem::Specification.new do |s|
  s.name = 'job_log'
  s.version = '0.1.0'
  s.summary = 'Logs the start and end of a job by subscribing to the SPS topic log.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/job_log.rb']
  s.add_runtime_dependency('dynarex', '~> 1.7', '>=1.7.26')
  s.add_runtime_dependency('sps-sub', '~> 0.3', '>=0.3.6')
  s.signing_key = '../privatekeys/job_log.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/job_log'
end
