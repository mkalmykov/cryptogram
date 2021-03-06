# Cryptogram

[![Gem Version](https://badge.fury.io/rb/cryptogram.svg)](https://badge.fury.io/rb/cryptogram)

## Builds

Master:

[![Build Status](https://travis-ci.org/mkalmykov/cryptogram.svg?branch=master)](https://travis-ci.org/mkalmykov/cryptogram)

Develop:

[![Build Status](https://travis-ci.org/mkalmykov/cryptogram.svg?branch=develop)](https://travis-ci.org/mkalmykov/cryptogram)

Cryptogram in intended to combine various ciphers in one library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptogram'
```

Or use the `master` branch if you would like to have the latest updates:

```ruby
gem 'cryptogram', github: 'mkalmykov/cryptogram'
```

Or install it yourself as:

    $ gem install cryptogram

## Implemented ciphers

* [Caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher)

## Usage

```ruby
require 'cryptogram'

alphabet = Array('a'..'z')
shift = 3

encryptor = Cryptogram::Ciphers::Caesar.new(alphabet: alphabet, shift: shift)

encryptor.encrypt('Pack my box with five dozen liquor jugs')
 # => "Sdfn pb era zlwk ilyh grchq oltxru mxjv

encryptor.decrypt('Sdfn pb era zlwk ilyh grchq oltxru mxjv')
 # => "Pack my box with five dozen liquor jugs"
```

You can also use built-in alphabet presets (`lib/cryptogram/presets/alphabets.rb`):

```ruby
encryptor = Cryptogram::Ciphers::Caesar.new(alphabet: :english, shift: shift)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mkalmykov/cryptogram.

To contribute:

1. Fork it.
2. `git checkout -b feature/my_awesome_feature develop`
3. Create a pull request into develop.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
