module Simplecast
  class Client
    module Podcast
      class << self
        include Simplecast::Client::Resource 
      end
    end
  end
end
