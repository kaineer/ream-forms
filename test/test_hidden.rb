require 'ream/form'

include Ream::Form

context "input type=hidden" do
  setup do
    @input = Hidden.new
  end

  it "should render with type='hidden' attribute" do
    @input.render.should.include?( "type='hidden'" )
  end
end
