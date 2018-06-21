# Simplecast

## Note: This gem is untested and currently unmaintained.
With Simplecast being under new leadership, I've spoken with their team about upcoming API changes. Instead of focusing on developing this gem more completely under the current API, I've chosen to wait until the new changes are released. This gem (or a version of it, anyway) powers [Spec.fm](https://spec.fm), but I recommend testing thoroughly. Optionally, use Simplecast's already-supported RSS feed as a reliable (albeit limited) alternative.

Simplecast is awesome. So is Ruby. Use them both. Profit.

Note: Publishing is not currently supported by the Simplecast API, and thus is also not supported by this gem. It probably will be one day. Who knows?

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplecast'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simplecast

## Usage

Set up the gem in a config file (if you're using Rails, just add something like a simplecast.rb in initializers).

Right now, there are only two config options: `api_key` and `podcast_id`. Your API key can be found in your [account settings](https://simplecast.com/user/edit).

Your `podcast_id` is in the URL for your account, and is likely just a number.

```ruby
Simplecast.configure do |c|
  c.api_key "Your_api_key_here"
  c.podcast_id "Your_podcast_id_here"
end
```

Next, you can access Podcasts, Episodes, and Statistics like this:

```ruby
# Episodes
Simplecast::Client::Episode.all # gets all podcasts, as long as podcast_id was set in the config
Simplecast::Client::Episode.all(podcast_id) # gets all podcasts, as long as podcast_id was set in the config
Simplecast::Client::Episode.find(episode_id)
Simplecast::Client::Episode.find(episode_id, podcast_id)

# Podcast
Simplecast::Client::Podcast.all
Simplecast::Client::Podcast.find(podcast_id)

# Statistics
# the overall method takes timeframe parameters as defined at https://api.simplecast.com - /podcasts/:podcast_id/statistics/overall.json 
Simplecast::Client::Statistic.overall(podcast_id, options:{})

# returns listener stats. /podcasts/:podcast_id/statistics.json
Simplecast::Client::Statistic.all(podcast_id)

# returns stats for a given episode. Takes timeframe params. /podcasts/:podcast_id/statistics/episode.json
Simplecast::Client::Statistic.for_episode(episode_id, podcast_id: nil, opts: {})
```

## Contributing

1. Fork it ( https://github.com/jcutrell/simplecast/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
