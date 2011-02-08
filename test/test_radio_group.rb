require 'test/test_helper'

context "Radio group" do
  setup do 
    @group = RadioGroup.new( "group[id]", [[ 1, "Green" ], [ 2, "Red" ]],
                                :selected => [ 1 ] )
    @render = @group.render
    @inputs = @render.scan( /<input[^>]+>/ )
    @radio_buttons = @inputs.select{|i|i.include?( "'radio'" )}
  end

  it "should contain two radio buttons" do
    @radio_buttons.size.should == 2
  end

  # NOTE: do not see why I should repeat tests for CheckboxGroup
end
