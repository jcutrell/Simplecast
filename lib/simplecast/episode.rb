require 'ostruct'
module Simplecast
  class Episode < OpenStruct
    include Simplecast::Model
    def embed
      Simplecast::Client::Episode.embed(id)
    end
  end
end
