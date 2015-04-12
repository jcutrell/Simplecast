require 'hurley'
module Simplecast
  class Client
    module Statistic
      class << self
        include Simplecast::Client::Resource
        def for_episode(episode_id, podcast_id: nil, opts: {})
          opts.merge!({episode_id: episode_id})
          podcast_id ||= client.podcast_id # TODO: || raise Simplecast::Error.new("Podcast ID must be supplied either in configuration or directly to the #for_episode method.")
          q = Hurley::Query::Flat.new(opts).to_query_string
          api_obj = client.get("podcasts/#{podcast_id}/statistics/episode.json?#{q}")
          model.new(api_obj)
        end
        def overall(podcast_id: nil, opts: { timeframe: "recent" })
          podcast_id ||= client.podcast_id
          q = Hurley::Query::Flat.new(opts).to_query_string
          api_obj = client.get("podcasts/#{podcast_id}/statistics/overall.json?#{q}")
          model.new(api_obj)
        end
        def all(podcast_id: nil)
          podcast_id ||= client.podcast_id
          api_obj_array = client.get("podcasts/#{podcast_id}/statistics.json")
          api_obj_array.map {|api_obj| model.new(api_obj) }
        end
      end
    end
  end
end
