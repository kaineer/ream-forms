require 'test/test_helper'

context "Submit input" do
  setup do
    @submit = Submit.new( "Ok" )
  end

  it "should render with value='Ok' attribute" do
    @submit.render.should.include( "value='Ok'" )
  end
end
