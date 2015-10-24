Gem::Specification.new do |s|
  s.name = 'rss_to_dynarex'
  s.version = '0.1.7'
  s.summary = 'rss_to_dynarex'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb', 'lib/**/rss_to_dynarex.xsl']
  s.add_runtime_dependency('nokogiri', '~> 1.6', '>=1.6.2.1')
  s.add_runtime_dependency('dynarex', '~> 1.2', '>=1.2.90')
  s.signing_key = '../privatekeys/rss_to_dynarex.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/rss_to_dynarex'
  s.required_ruby_version = '>= 2.1.2'
end
