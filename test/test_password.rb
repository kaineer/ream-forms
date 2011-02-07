require 'ream/form'

include Ream::Form

context "input type=password" do
  setup do
    @input = Password.new
  end

  it "should render with type='password' attribute" do
    @input.render.should.include( "type='password'" )
  end
end
