# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_remote/bulk/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_remote-bulk'
  spec.version       = ActiveRemote::Bulk::VERSION
  spec.authors       = ['Adam Hutchison']
  spec.email         = ['liveh2o@gmail.com']

  spec.summary       = 'Bulk methods for ActiveRemote'
  spec.description   = 'Bulk methods for ActiveRemote'
  spec.homepage      = 'https://github.com/mxenabled/active_remote-bulk'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'active_remote', '>= 2.4'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
