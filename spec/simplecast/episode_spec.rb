require 'spec_helper'

describe "Simplecast::Episode" do
  it "Should respond to embed" do
    episode = Simplecast::Episode.new
    expect(episode).to respond_to(:embed)
  end
end
