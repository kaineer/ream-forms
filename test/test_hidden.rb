require 'ream/form'

context "input type=hidden" do
  setup do
    @input = Ream::Form::Hidden.new
  end

  it "should render with type='hidden' attribute" do
    @input.render.should.include?( "type='hidden'" )
  end
end
