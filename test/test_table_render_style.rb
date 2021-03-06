require 'test/test_helper'

context "Form with table render style" do
  setup do
    @myform = ::TestForm.new( RenderStyle::Table.new )
    @doc = Nokogiri::XML( @myform.render )
  end

  it "should contain table" do
    @doc.xpath( "/form/table" ).size.should.be == 1
  end

  it "should contain table with one row" do
    @doc.xpath( "//table/tr" ).size.should.be == 1
  end

  it "should contain table with one row and two td inside" do
    @doc.xpath( "//table/tr/td" ).size.should.be == 2
  end

  context ".. label inside" do
    setup do
      @label = @doc.xpath( "//td/label" ).first
    end

    it "should exist" do
      @label.should.not.be == nil
    end

    it "should have text 'button-label'" do
      @label.text().should.be == "button-label"
    end

    it "should have for='teh_button'" do
      @label['for'].should.be == "teh_button"
    end
  end


  context ".. first td" do
    setup do
      @td = @doc.xpath( "//table/tr/td" )[ 0 ]
    end

    it "shoud contain label" do
      @td.xpath( "label" ).size.should == 1
    end
  end


  context ".. second td" do
    setup do
      @td = @doc.xpath( "//table/tr/td" )[ 1 ]
    end

    it "should contain input" do
      @td.xpath( "input" ).size.should == 1
    end
  end
end

context "Form with input group and table render style" do
  setup do
    @form = ::TestFormWithInputGroup.new( RenderStyle::Table.new )
    @doc = Nokogiri::XML( @form.render )
  end

  it "should contain form" do
    @doc.xpath( "//form" ).size.should.be > 0
  end

  context ".. second td in tr" do
    setup do
      @td = @doc.xpath( "//tr/td" )[ 1 ]
    end

    it "should contain several inputs" do
      @td.xpath( "//input" ).size.should.be == 3
    end

    it "should have inputs with type checkbox" do
      @td.xpath( "//input" )[rand(3)][ "type" ].should == "checkbox"
    end

    it "should have 5 subnodes" do
      @td.xpath( "*" ).size.should == 5
    end

    it "should contain inputs in even places (0, 2, 4)" do
      nodes = @td.xpath( "*" )
      assert( [ 0, 2, 4 ].map{|i|nodes[i].name}.all?{|s| s == "input" } )
    end

    it "should contain br in odd places (1, 3)" do
      nodes = @td.xpath( "*" )
      assert( [ 1, 3 ].map{|i|nodes[i].name}.all?{|s| s == "br" } )
    end
  end
end
