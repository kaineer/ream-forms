require 'ream/form'

include Ream::Form

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
  end

  it "should render and have method='GET' fragment inside" do
    @form.render.should.include( "method='GET'" )
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

context "Form with inputs in block" do
  setup do
    @form = Form.new( "/update/something" ) do |f|
      f.text( "login" )
    end
    
    @render = @form.render
  end

  it "should contain input" do
    @render.should.include( "<input" )
  end
end
