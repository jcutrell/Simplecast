$:.unshift File.dirname(__FILE__)
require "simplecast/version"
require "simplecast/configurable"

require "simplecast/model"
require "simplecast/podcast"
require "simplecast/episode"
require "simplecast/statistic"

require "simplecast/client"
require "simplecast/client/resource"
require "simplecast/client/podcast"
require "simplecast/client/episode"
require "simplecast/client/statistic"

module Simplecast
  class << self
    include Simplecast::Configurable
    def client
      @client = Simplecast::Client.new(options) unless defined?(@client)
      @client
    end
  end
end
