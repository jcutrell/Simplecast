require 'spec_helper'

describe Simplecast::Client do

  describe "module configuration" do

    before do
      Simplecast.configure do |c|
        Simplecast::Configurable.keys.each do |key|
          c.send("#{key}=", "Some #{key}")
        end
      end
    end

    it "inherits the module configuration" do
      client = Simplecast::Client.new
      Simplecast::Configurable.keys.each do |key|
        expect(client.instance_variable_get(:"@#{key}")).to eq("Some #{key}")
      end
    end

  end

end
