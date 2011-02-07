require 'ream/form'

include Ream::Form

context "default textarea" do
  setup do
    @textarea = Textarea.new
  end

  it "should start with textarea tag" do
    assert( /^<textarea/ === @textarea.render )
  end

  it "should end with closing textarea tag" do
    assert( /<\/textarea>$/ === @textarea.render )
  end
  
  it "should contain no text inside" do
    @textarea.render.should.include( "><" )
  end
end

context "textarea with name set" do
  setup do
    @textarea = Textarea.new( "textarea_name" )
  end

  it "should render name atribute" do
    @textarea.render.should.include( "name='textarea_name'" )
  end
end

context "textarea with value set" do
  setup do
    @textarea = Textarea.new( nil, "textarea_value" )
  end

  it "should render value between tags" do
    @textarea.render.should.include( ">textarea_value<" )
  end
end
