require 'test/test_helper'

context "Checkbox w/o checked opt" do
  setup do
    @checkbox = Checkbox.new( "logged_in" )
    @render = @checkbox.render
  end
  
  it "should render without checked attribute" do
    @render.should.not.include( "checked='checked'" )
  end
end

context "Checkbox w/ checked opt" do
  setup do
    @checkbox = Checkbox.new( "logged_in", :checked => true )
    @render = @checkbox.render
  end

  it "should render with name='logged_in' attribute" do
    @render.should.include( "name='logged_in'" )
  end

  it "should render with checked attribute" do
    @render.should.include( "checked='checked'" )
  end
end
