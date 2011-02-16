require 'test/test_helper'

context "Default form" do
  setup do
    @path = "/path"
    @form = Form.new( @path )
  end

  it "should have method POST by default" do
    @form.http_method.should.be == "POST"
  end

  it "should have specified path as action" do
    @form.action.should.be == @path
  end

  it "should render as empty html form" do
    @form.render.should.be == "<form action='#{@path}' method='POST'></form>"
  end
end

context "Form with method GET" do
  setup do 
    @path = "/"
    @form = Form.new( @path, "GET" )
    @doc = Nokogiri::XML( @form.render )
  end

  it "should render and have method='GET' fragment inside" do
    @doc.xpath( "/form" ).first[ :method ].should == "GET"
  end
end

context "Form DSL" do
  setup do
    @path = "/"
  end

  it "should be created through DSL" do
    @form = Ream::Form.form( @path ) {|f| }
    @form.class.should.be( Ream::Form::Form )
  end
end

context "Form with symbol instead of action" do
  setup do
    @form = Form.new( :object )
  end

  it "should use symbol name to create form's action" do
    @form.render.should.include( "/object/update" )
  end
end

context "Form with symbol instead of action and action in options hash" do
  setup do
    @form = Form.new( :object, :action => "/update/something" )
    @doc = Nokogiri::XML( @form.render )
  end

  it "should have specified action" do
    @doc.xpath( "/form" ).first[ :action ].should == "/update/something"
  end
end

context "Form with object instead of action" do
  setup do
    class SampleName; end
    @object = mock( "object" )
    @object.stubs( :class ).returns( SampleName )
    @object.stubs( :id ).returns( 10 )

    @form = Form.new( @object )
    @doc = Nokogiri::XML( @form.render )
  end

  it "should have action /sample_name/update/10" do
    @doc.xpath( "/form" ).first[ :action ].should.be == "/sample_name/update/10"
  end
end

context "Form with inputs in block" do
  setup do
    @form = Form.new( "/update/something" ) do |f|
      f.text( "login" )
    end
    
    @doc = Nokogiri::XML( @form.render )
  end

  it "should contain input" do
    @doc.xpath( "//input" ).size.should.be == 1
  end
end
