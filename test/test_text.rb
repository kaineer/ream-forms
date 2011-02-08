require 'test/test_helper'

context "input type=text" do
  setup do
    @input = Text.new
  end

  it "should render with type='text' attribute" do
    @input.render.should.include( "type='text'" )
  end
end
