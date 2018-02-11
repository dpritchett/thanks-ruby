lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thanks/version'

Gem::Specification.new do |spec|
  spec.name          = 'thanks'
  spec.version       = Thanks::VERSION
  spec.authors       = ['Daniel J. Pritchett']
  spec.email         = ['dpritchett@gmail.com']

  # rubocop:disable Metrics/LineLength
  spec.summary       = 'Find out how to support the authors of the gems you depend on'
  spec.description   = 'Find out how to support the authors of the gems you depend on'
  # rubocop:enable Metrics/LineLength
  #
  spec.homepage      = 'https://github.com/dpritchett/thanks-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ['thanks_rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
end
