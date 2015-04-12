require 'ostruct'
module Simplecast
  class Episode < OpenStruct
    include Simplecast::Model
    def embed
      Simplecast::Client::Episode.embed(id)
    end
    def podcast
      Simplecast::Client::Podcast.find(podcast_id)
    end
  end
end
