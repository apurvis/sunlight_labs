module SunlightLabs
  module Congress
    class Legislator
      include Virtus.model

      LEGISLATOR_PATH = '/legislators'
      LEGISLATOR_LOCATE_PATH = LEGISLATOR_PATH + '/locate'

      # User Virtus to coerce some fields; for others just use method_missing to look at the
      # returned hash
      attribute :birthday, Date
      attribute :term_end, Date
      attribute :term_start, Date
      attribute :facebook_id, Integer

      def initialize(attributes_hash)
        self.attributes = @attributes = attributes_hash
      end

      def method_missing(name)
        if @attributes.has_key?(name.to_s)
          @attributes[name.to_s]
        else
          fail NoMethodError, "#{self.class}.#{name}"
        end
      end

      def self.where(options = {})
        if options[:latitude] || options[:longitude]
          fail 'Need to provide both longitude and latitude' unless options[:latitude] && options[:longitude]
          path = LEGISLATOR_LOCATE_PATH
        end

        @@congress ||= SunlightLabs::Congress::API.new
        path ||= options[:zip] ? LEGISLATOR_LOCATE_PATH : LEGISLATOR_PATH

        response = @@congress.get(path, options)
        legislators = response['results']

        while response['page'] && response['page']['count'] == response['page']['per_page']
          response = @@congress.get(path, options.merge(page: response['page']['page'] + 1))
          legislators = response['results']
        end

        legislators.map { |l| Legislator.new(l) }
      end

      def self.all
        where
      end
    end
  end
end
