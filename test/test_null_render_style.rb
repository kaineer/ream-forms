require 'test/test_helper'

context "Null render style" do
  setup do
    @myform = ::TestForm.new( RenderStyle::Null.new )
  end

  it "should render form into empty line" do
    @myform.render_content.should == ""
  end
end
