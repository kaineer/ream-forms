require 'test/test_helper'

context "Default input group" do
  setup do
    @group = InputGroup.new
  end

  it "should have select type" do
    @group.type.should == :select
  end

  it "should have selected value equal to []" do
    @group.selected.should == []
  end
end
