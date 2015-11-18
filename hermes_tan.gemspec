Gem::Specification.new do |s|
  s.name        = 'hermes_tan'
  s.version     = '0.1.4'
  s.date        = '2015-11-17'
  s.summary     = "Send emails with fun!"
  s.description = "A simple gem for sending multiple emails from gmail account."
  s.authors     = ["Ostap Tan"]
  s.email       = 'otan256@gmail.com'
  s.files       = ["lib/hermes_tan.rb"]
  s.homepage    = 'http://rubygems.org/gems/hermes_tan'
  s.has_rdoc    = 'yard'
  s.license     = 'MIT'

  s.add_runtime_dependency 'ruby-gmail', '~> 0.3.1'
  s.add_development_dependency 'rspec', '~> 3.2'
end
