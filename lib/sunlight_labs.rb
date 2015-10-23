require 'faraday'
require 'faraday_middleware'
require 'logger'
require 'virtus'

module SunlightLabs
  Dir.glob('lib/**/*.rb') { |f| require_relative f }
end
