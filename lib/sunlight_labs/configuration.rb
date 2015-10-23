module SunlightLabs
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  def self.reset!
    self.configuration = Configuration.new
  end

  class Configuration
    DEFAULT_CONGRESS_URI = 'https://congress.api.sunlightfoundation.com'

    attr_accessor :api_key
    attr_accessor :congress_uri

    def initialize
      @congress_uri = DEFAULT_CONGRESS_URI
    end
  end
end
