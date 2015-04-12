require 'hurley'
require 'json'
require 'simplecast/configurable'
module Simplecast
  class Client
    include Simplecast::Configurable
    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      Simplecast::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Simplecast.instance_variable_get(:"@#{key}"))
      end
      @client = Hurley::Client.new('https://api.simplecast.fm/v1/')
      @client.header["X-API-KEY"] = @api_key
      @client
    end
    def request(method, path, data, options = {})
      if data.is_a?(Hash)
        options[:query]   = data.delete(:query) || {}
        options[:headers] = data.delete(:headers) || {}
        if accept = data.delete(:accept)
          options[:headers][:accept] = accept
        end
      end
      @last_response = response = @client.send(method, URI::Parser.new.escape(path.to_s), data, options)
      response.data
    end
    def get(url)
      puts "Log request: #{url.inspect}"
      response = @client.get(url)
      JSON.parse(response.body)
    end
  end
end
