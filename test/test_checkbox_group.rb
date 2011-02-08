require 'test/test_helper'

context "Checkbox group" do
  setup do
    @group = CheckboxGroup.new( "group[id]", [[ 1, "Green" ], [ 2, "Red" ]],
                                :selected => [ 1 ] )
    @render = @group.render
    @inputs = @render.scan( /<input[^>]+>/ )
    @checkboxes = @inputs.select{|i|i.include?( "'checkbox'" )}
    @green = @checkboxes.find{|c|c.include?("value='1'")}
    @red   = @checkboxes.find{|c|c.include?("value='2'")}
  end

  it "should contain two checkboxes" do
    @checkboxes.size.should == 2
  end

  it "should have green checkbox checked" do
    @green.should.include( "checked=" )
  end

  it "should have red checkbox unchecked" do
    @red.should.not.include( "checked=" )
  end
end
