require File.expand_path('../lib/foreman_netbox/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'foreman_netbox'
  s.version     = ForemanNetbox::VERSION
  s.license     = 'GPL-3.0'
  s.authors     = ['Stephen Nelson jr']
  s.email       = ['jrsacmarie@gmail.com']
  s.homepage    = 'https://github.com/stephen-nelsonjr/foreman_netbox.git'
  s.summary     = 'This plugin will automate the process of managing the ip adresses of hosts.'
  # also update locale/gemspec.rb
  s.description = 'This plugin will automate the process of creating, deploying, and managing the subnets and ip addresses of foreman hosts.'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rdoc'
end
