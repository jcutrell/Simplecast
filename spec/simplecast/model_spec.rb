require 'spec_helper'
describe "Simplecast::Model" do
  before do
    class Simplecast::TestModel < OpenStruct
      include Simplecast::Model
    end
  end
  it "Should allow any attributes to be passed to it" do
    model = Simplecast::TestModel.new({attr_one: "Yes", something_else: "Whatever"})
    expect(model).to respond_to(:attr_one)
    expect(model).to respond_to(:something_else)
    expect(model).not_to respond_to(:foozle)
    expect(model.attr_one).to eq("Yes")
  end
end
