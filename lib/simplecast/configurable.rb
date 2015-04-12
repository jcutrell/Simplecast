module Simplecast
  module Configurable
    attr_accessor :api_key, :podcast_id
    class << self
      def keys
        @keys ||= [
          :api_key,
          :podcast_id
        ]
      end
    end
    def configure
      yield self
    end
    def options
      Hash[Simplecast::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end
  end
end
