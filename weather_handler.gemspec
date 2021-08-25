require_relative 'lib/weather_handler/version'

Gem::Specification.new do |spec|
  spec.name          = 'weather_handler'
  spec.version       = WeatherHandler::VERSION
  spec.authors       = ['Ivan Viter']
  spec.email         = ['ivanviter@i.ua']

  spec.summary       = %q{Weather Handler gem is created for purpose of finding weather on any city}
  spec.description   = %q{This gem will find weather for your city}
  spec.homepage      = 'https://rubygems.org/gems/weather_handler'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = 'https://github.com/iviter/weather_handler'
  spec.metadata['source_code_uri'] = 'https://github.com/iviter/weather_handler'
  spec.metadata['changelog_uri'] = 'https://github.com/iviter/weather_handler/blob/master/README.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency('rake', '~> 12.0')
  spec.add_development_dependency('rspec', '~> 3.0')
  spec.add_development_dependency('dotenv', '~> 2.7', '>= 2.7.6')
  spec.add_development_dependency('rest-client', '~> 2.1')
  spec.add_development_dependency('retryable', '~> 3.0', '>= 3.0.5')

  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')
end
