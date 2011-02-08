require 'test/test_helper'

context "Checkbox group" do
  setup do
    @group = CheckboxGroup.new( "group[id]", [[ 1, "Green" ], [ 2, "Red" ]],
                                :selected => [ 1 ] )
    @render = @group.render
    @inputs = @render.scan( /<input[^>]+>/ )
    @checkboxes = @inputs.select{|i|i.include?( "'checkbox'" )}
  end

  it "should contain two checkboxes" do
    @checkboxes.size.should == 2
  end

  context ".. green checkbox" do
    setup do
      @green = @checkboxes.find{|c|c.include?("value='1'")}
    end
    
    it "should be checked" do
      @green.should.include( "checked=" )
    end

    it "should have name group[id][]" do
      @green.should.include( "group[id][]" )
    end
  end

  context ".. red checkbox" do
    setup do
      @red   = @checkboxes.find{|c|c.include?("value='2'")}
    end

    it "should not be checked" do
      @red.should.not.include( "checked=" )
    end

    it "should have name group[id][]" do
      @red.should.include( "group[id][]" )
    end
  end
end
