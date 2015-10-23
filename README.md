# SunlightLabs

Faraday based Ruby wrapper for Sunlight Labs Congress API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sunlight_labs', github: 'apurvis/sunlight_labs'
```

And then execute:

    $ bundle

## Usage

Configure it:

```ruby
require 'sunlight_labs'

SunlightLabs.configure do |config|
  config.api_key = 'it_takes_grindin_to_be_king'
end
```

Make requests.

```ruby
congresspeople = SunlightLabs::Congress::Legislator.where(zip: 11206)

congresspeople = SunlightLabs::Congress::Legislator.where(longitude: -73.953552, latitude:  40.712247)

# Pagination is handled for you
congresspeople = SunlightLabs::Congress::Legislator.all
congresspeople.size # => 435
```

## Debugging

The SUNLIGHT_API_DEBUG environment variable will trigger full printouts of Faraday's debug output to STDERR and to the configured logger.

```bash
cd /my/app
export SUNLIGHT_API_DEBUG=true
bundle exec rails whatever
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apurvis/sunlight_labs.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

