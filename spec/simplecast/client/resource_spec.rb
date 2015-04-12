require 'spec_helper'

describe Simplecast::Client::Resource do
  before do
    module Simplecast
      class Client
        module Test
          class << self
            include Simplecast::Client::Resource
          end
        end
      end
    end
  end
  it "should return the proper resource name" do
    tc = Simplecast::Client::Test
    expect(tc.resource_plural_name_lower).to eq("tests")
  end
  it "should return an instance of Simplecast::Client" do
    expect(Simplecast::Client::Test.client).to be_an_instance_of(Simplecast::Client)
  end
end
