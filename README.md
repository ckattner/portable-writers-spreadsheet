# Portable Spreadsheet Writer

[![Gem Version](https://badge.fury.io/rb/portable-writers-spreadsheet.svg)](https://badge.fury.io/rb/portable-writers-spreadsheet) [![Build Status](https://travis-ci.org/bluemarblepayroll/portable-writers-spreadsheet.svg?branch=master)](https://travis-ci.org/bluemarblepayroll/portable-writers-spreadsheet) [![Maintainability](https://api.codeclimate.com/v1/badges/3984ca34a23267b3ea0a/maintainability)](https://codeclimate.com/github/bluemarblepayroll/portable-writers-spreadsheet/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/3984ca34a23267b3ea0a/test_coverage)](https://codeclimate.com/github/bluemarblepayroll/portable-writers-spreadsheet/test_coverage) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This library is a plugin for [Portable](https://github.com/bluemarblepayroll/portable) and provides a new document writer for rendering spreadsheets.  It currently is limited to Microsoft Excel Open XML Spreadsheets (.xlsx) and uses the library [fast_excel](https://github.com/Paxa/fast_excel) under the hood.

## Installation

To install through Rubygems:

````
gem install install portable-writers-spreadsheet
````

You can also add this to your Gemfile:

````
bundle add portable-writers-spreadsheet
````

## Examples

See the main [Portable](https://github.com/bluemarblepayroll/portable) repository for examples.  The only difference is if you wish to use this library then render documents with Portable::Writers::Spreadsheet (instead of Portable::Writers::Csv).

## Contributing

### Development Environment Configuration

Basic steps to take to get this repository compiling:

1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (check portable-writers-spreadsheet.gemspec for versions supported)
2. Install bundler (gem install bundler)
3. Clone the repository (git clone git@github.com:bluemarblepayroll/portable-writers-spreadsheet.git)
4. Navigate to the root folder (cd portable-writers-spreadsheet)
5. Install dependencies (bundle)

### Running Tests

To execute the test suite run:

````bash
bundle exec rspec spec --format documentation
````

Alternatively, you can have Guard watch for changes:

````bash
bundle exec guard
````

Also, do not forget to run Rubocop:

````bash
bundle exec rubocop
````

### Publishing

Note: ensure you have proper authorization before trying to publish new versions.

After code changes have successfully gone through the Pull Request review process then the following steps should be followed for publishing new versions:

1. Merge Pull Request into master
2. Update `lib/portable-writers-spreadsheet/version.rb` using [semantic versioning](https://semver.org/)
3. Install dependencies: `bundle`
4. Update `CHANGELOG.md` with release notes
5. Commit & push master to remote and ensure CI builds master successfully
6. Run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Code of Conduct

Everyone interacting in this codebase, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bluemarblepayroll/portable-writers-spreadsheet/blob/master/CODE_OF_CONDUCT.md).

## License

This project is MIT Licensed.
