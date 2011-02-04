require 'ream/form'

context "input type=password" do
  setup do
    @input = Ream::Form::Password.new
  end

  it "should render with type='password' attribute" do
    @input.render.should.include?( "type='password'" )
  end
end
