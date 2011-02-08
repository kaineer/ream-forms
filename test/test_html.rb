require 'test/test_helper'

include Ream::Form::Html

context "Html tag" do
  setup do
    @tag = Tag.new
  end

  it "should have no name" do
    @tag.name.should == nil
  end

  it "should not render" do
    @tag.render.should == ""
  end

  context ".. with specified name" do
    setup do
      @tag.name( "input" )
    end
    
    it "should have specified name" do
      @tag.name.should == "input"
    end
  end
end

context "Html tag with name" do
  setup do 
    @tag = Tag.new( "input" )
  end

  it "should have specified name" do
    @tag.name.should == "input"
  end

  it "should render with that name in open tag" do
    @tag.render.should.include( "<input" )
  end

  it "should render empty tag end" do
    @tag.render.should.include( "/>" )
  end
end

context "Html tag with attributes" do
  setup do
    @tag = Tag.new( "input" )
    @tag.attr( "name", "login[name]" ).attr( "id", "login_name" )
  end

  it "should render name attribute" do
    @tag.render.should.include( "name='login[name]'" )
  end

  it "should render id attribute" do
    @tag.render.should.include( "id='login_name'" )
  end
end

context "Html with closing" do
  setup do
    @tag = Tag.new( "textarea" )
    @tag.close_tag
  end

  it "should render closing tag" do
    @tag.render.should.include( "</textarea>" )
  end
end

context "Html tag with children" do
  setup do
    @tag = Tag.new( "parent" ) do |t|
      t.tag( "child" )
    end

    @render = @tag.render
  end

  it "should render child tag inside parent tag" do
    @render.should == "<parent><child/></parent>"
  end
end
