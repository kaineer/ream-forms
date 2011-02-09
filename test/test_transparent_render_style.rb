require 'test/test_helper'

context "Form with transparent render style" do
  setup do
    @transparent_form = ::TestForm.new( RenderStyle::Transparent.new )
    @raw_form = ::TestForm.new
  end

  it "should render same way as raw form" do
    @transparent_form.render_content.should == @raw_form.render_content
  end
end
