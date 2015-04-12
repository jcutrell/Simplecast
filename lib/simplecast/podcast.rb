require 'ostruct'
module Simplecast
  class Podcast < OpenStruct
    include Simplecast::Model
    def episodes
      Simplecast::Client::Episode.all(id)
    end
  end
end
