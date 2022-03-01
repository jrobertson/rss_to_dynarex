Gem::Specification.new do |s|
  s.name = 'rss_to_dynarex'
  s.version = '0.2.1'
  s.summary = 'rss_to_dynarex'
  s.authors = ['James Robertson']
  s.files = Dir['lib/rss_to_dynarex.rb', 'lib/rss_to_dynarex.xsl']
  s.add_runtime_dependency('nokogiri', '~> 1.13', '>=1.13.3')
  s.add_runtime_dependency('dynarex', '~> 1.9', '>=1.9.7')
  s.signing_key = '../privatekeys/rss_to_dynarex.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/rss_to_dynarex'
  s.required_ruby_version = '>= 2.1.2'
end
