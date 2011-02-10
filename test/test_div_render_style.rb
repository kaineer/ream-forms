require 'test/test_helper'

context "Form with div render style" do
  setup do
    @form = ::TestForm.new( RenderStyle::Div.new )
    @doc  = Nokogiri::XML( @form.render )
  end

  it "should contain div with form class" do
    @doc.xpath( "/form/div[@class='form']" ).size.should == 1
  end

  it "should contain child div with row class" do
    @doc.xpath( "/form/div/div[@class='row']" ).size.should == 1
  end

  context "row div" do
    setup do
      @div = @doc.xpath( "/form/div/div[@class='row']" ).first
    end

    it "should contain div.label" do
      @div.xpath( "div[@class='label']" ).size.should == 1
    end

    context "label div" do
      setup do
        @label_div = @div.xpath( "div[@class='label']" ).first
      end

      it "should contain label" do
        @label_div.xpath( "label" ).size.should == 1
      end

      it "should contain label with text from label caption" do
        @label_div.xpath( "label" ).first.text.should == "button-label"
      end

      it "should contain label with for == teh_button" do
        @label_div.xpath( "label" ).first[ :for ].should == "teh_button"
      end
    end

    it "should contain input div" do
      @div.xpath( "div[@class='input']" ).size.should == 1
    end

    context "input div" do
      setup do
        @input_div = @div.xpath( "div[@class='input']" ).first
      end

      it "should contain input" do
        @input_div.xpath( "input" ).size.should == 1
      end
    end
  end
end

context "Form with input group with div render style" do
  setup do
    @form = ::TestFormWithInputGroup.new( RenderStyle::Div.new )
    @doc = Nokogiri::XML( @form.render )
  end

  it "should have div.item inside" do
    @doc.xpath( "//div[@class='item']" ).size.should.be > 0
  end

  context "label in row" do
    setup do 
      @label_div = @doc.xpath( "//div[@class='row']/div[@class='label']" ).first
    end

    it "should contain label" do
      @label_div.xpath( "label" ).size.should.be == 1
    end

    it "should contain label with Colours text" do
      @label_div.xpath( "label" ).first.text.should.be == "Colours"
    end
  end

  context "item div" do
    setup do
      @item = @doc.xpath( "//div[@class='item']" ).first
    end

    it "should contain input" do
      @item.xpath( "input[@type='checkbox']" ).size.should.be == 1
    end

    it "should contain input with id == teh_boxes_1" do
      @item.xpath( "input[@type='checkbox']" ).first[ :id ].should.be == "teh_boxes_1"
    end

    it "should contain input's label" do
      @item.xpath( "label" ).size.should.be == 1
    end
    
    it "should contain label with @for == teh_boxes_1" do
      @item.xpath( "label" ).first[ :for ].should == "teh_boxes_1"
    end

    it "should contain label with text == Red" do
      @item.xpath( "label" ).first.text.should == "Red"
    end
  end
end
