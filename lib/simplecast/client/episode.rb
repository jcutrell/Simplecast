module Simplecast
  class Client
    module Episode
      class << self
        include Simplecast::Client::Resource
        def find(id, podcast_id = nil)
          podcast_id ||= client.podcast_id
          api_obj = client.get("podcasts/#{podcast_id}/episodes/#{id}.json")
          model.new(api_obj)
        end
        def embed(id, podcast_id = nil)
          podcast_id ||= client.podcast_id
          api_obj = client.get("podcasts/#{podcast_id}/episodes/#{id}/embed.json")
        end
        def all(podcast_id = nil)
          podcast_id ||= client.podcast_id
          api_obj_array = client.get("podcasts/#{podcast_id}/episodes.json")
          api_obj_array.map {|api_obj| model.new(api_obj) }
        end
      end
    end
  end
end
