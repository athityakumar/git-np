lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git_np/version'

Gem::Specification.new do |spec|
  spec.name          = 'git_np'
  spec.version       = GitNP::VERSION
  spec.authors       = ['Athitya Kumar']
  spec.email         = ['athityakumar@gmail.com']
  spec.summary       = "A Ruby CLI gem that makes it easier to start new Git projects, by facilitating easy generation of required markdown files."
  spec.homepage      = 'https://github.com/athityakumar/colorls'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = 'git-np'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rubygems-tasks'
  spec.add_development_dependency 'ruumba'
end
