require 'spec_helper'

describe Simplecast::Client::Podcast do
  it "#responds_to :all" do
    expect(Simplecast::Client::Podcast).to respond_to(:all)
  end
  it "#responds_to :find" do
    expect(Simplecast::Client::Episode).to respond_to(:find)
  end
end
