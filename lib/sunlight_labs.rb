require 'faraday'
require 'faraday_middleware'
require 'logger'
require 'virtus'

module SunlightLabs
  Dir.glob('lib/sunlight_labs/**/*.rb') { |f| require_relative f }
end
