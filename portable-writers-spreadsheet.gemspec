# frozen_string_literal: true

require './lib/portable/writers/spreadsheet/version'

Gem::Specification.new do |s|
  s.name        = 'portable-writers-spreadsheet'
  s.version     = Portable::Writers::Spreadsheet::VERSION
  s.summary     = 'Plugs in a spreadsheet writer for the Portable library'

  s.description = <<-DESCRIPTION
    Portable is a virtual document object modeling library that only contains basic writers by default.  This library extends Portable and adds a Spreadsheet Writer implementation.
  DESCRIPTION

  s.authors     = ['Matthew Ruggio']
  s.email       = ['mruggio@bluemarblepayroll.com']
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir      = 'exe'
  s.executables = []
  s.homepage    = 'https://github.com/bluemarblepayroll/portable-writers-spreadsheet'
  s.license     = 'MIT'
  s.metadata    = {
    'bug_tracker_uri' => 'https://github.com/bluemarblepayroll/portable-writers-spreadsheet/issues',
    'changelog_uri' => 'https://github.com/bluemarblepayroll/portable-writers-spreadsheet/blob/master/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/portable-writers-spreadsheet',
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage
  }

  s.required_ruby_version = '>= 2.5'

  s.add_dependency('fast_excel', '~>0.3')
  s.add_dependency('portable', '=1.0.0-alpha.7')

  s.add_development_dependency('guard-rspec', '~>4.7')
  s.add_development_dependency('pry', '~>0')
  s.add_development_dependency('rake', '~> 13')
  s.add_development_dependency('roo', '~> 2.8')
  s.add_development_dependency('rspec', '~> 3.8')
  s.add_development_dependency('rubocop', '~>0.88.0')
  s.add_development_dependency('simplecov', '~>0.18.5')
  s.add_development_dependency('simplecov-console', '~>0.7.0')
end
