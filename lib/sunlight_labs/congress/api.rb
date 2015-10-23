module SunlightLabs
  module Congress
    class API
      attr_accessor :connection

      def initialize(options = {})
        fail "API Key not provided!" unless SunlightLabs.configuration && SunlightLabs.configuration.api_key

        @logger = options[:logger] || Logger.new(STDOUT)
        @connection = Faraday.new(url: 'https://congress.api.sunlightfoundation.com') do |connection|
          connection.request :json

          if ENV['SUNLIGHT_DEBUG'].to_s =~ /^(true|1)$/i
            connection.response :logger, @logger, bodies: true
          end

          connection.response :json, :content_type => /\bjson$/
          connection.adapter Faraday.default_adapter
        end
      end

      def get(path, options)
        @connection.get(path, options.merge(apikey: SunlightLabs.configuration.api_key)).body
      end
    end
  end
end
