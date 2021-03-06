# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcode_launcher/version'

Gem::Specification.new do |spec|
  spec.name          = 'xcode_launcher'
  spec.version       = XcodeLauncher::VERSION
  spec.authors       = ['Rodger Higgins']
  spec.email         = ['rdhiggins@gmail.com']

  spec.executables   = ['xcl']

  spec.summary       = 'xcode launcher.'
  spec.description   = 'Command Line utility to facilitate launching xcode from the command line.'
  spec.homepage      = 'https://github.com/rdhiggins/xcode_launcher.git'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'awesome_print'

  spec.add_dependency 'plist'
  spec.add_dependency 'colorize'
  spec.add_dependency 'ruby-progressbar'
end
