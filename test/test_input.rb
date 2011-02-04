require 'ream/form'

context "default input" do
  setup do
    @input = Ream::Form::Input.new
  end

  it "should have default text type" do
    @input.type.should == :text
  end

  it "should have empty options value" do
    @input.opts.should == {}
  end
  
  it "should render open tag" do
    @input.render.should.include?( "<input" )
  end

  it "should render type attribute" do
    @input.render.should.include?( "type='text'" )
  end

  it "should render as well-formed tag" do
    assert( /^<[^\/]+\/>$/ === @input.render )
  end

  it "should not include name attributes" do
    @input.render.should.not.include?( "name=" )
  end
end

context "input with name set" do
  setup do
    @input = Ream::Form::Input.new( "test_text_input" )
  end

  it "should render name attribute" do
    @input.render.should.include?( "name='test_text_input'" )
  end
end

context "input with value set" do
  setup do
    @input = Ream::Form::Input.new( "test_text_input", :text, "test_input_value" )
  end

  it "should render specified value in value attribute" do
    @input.render.should.include?( "value='test_input_value'" )
  end
end

context "input with id set and no class set" do
  setup do
    @input = Ream::Form::Input.new( "text_text_input", :text, :id => "input_id" )
  end

  it "should have id attribute rendered" do
    @input.render.should.include?( "id='input_id'" )
  end

  it "should not have class attribute rendered" do
    @input.render.should.not.include?( "class=" )
  end
end

context "input with field set and w/o form" do
  setup do
    @input = Ream::Form::Input.new( :test_field )
  end

  it "should not render value attribute" do
    @input.render.should.not.include?( "value=" )
  end

  it "should not render name attribute" do
    @input.render.should.not.include?( "name=" )
  end
end

context "input in form context" do
  setup do
    @form = Ream::Form::Form.new( :object )
    @input = Ream::Form::Input.new( :field )
    @form << @input
  end

  it "should render name attribute using form and input symbols" do
    @input.render.should.include?( "name='object[field]'" )
  end
end

context "input in form context with data object" do
  setup do
    @mock = mock( "data-object" )
    @mock_class = mock( "data-object-class" )
    @mock_class_name = mock( "data-object-class-name" )
    
    @mock.stubs( :class ).returns( @mock_class )
    @mock_class.stubs( :name ).returns( "MockClassName" )

    @mock.stubs( :field ).returns( "mock_object_field_value" )

    @form = Ream::Form::Form.new( @mock )
    @input = Ream::Form::Input.new( :field )

    @form << @input
  end

  it "should render name attribute using object class name" do
    @input.render.should.include?( "name='mock_class_name[field]'" )
  end

  it "should return form's object value of that field" do
    @input.value.should == "mock_object_field_value"
  end

  it "should render value attribute with value included" do
    @input.render.should.include?( "value='mock_object_field_value'" )
  end
end
