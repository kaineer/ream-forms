require 'ream/form'

context "input type=text" do
  setup do
    @input = Ream::Form::Text.new
  end

  it "should render with type='text' attribute" do
    @input.render.should.include?( "type='text'" )
  end
end
