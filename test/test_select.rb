require 'ream/form'

include Ream::Form

context "Select" do
  setup do
    @group = Select.new( nil, [[ 1, "Green" ], [ 2, "Red" ]], :selected => [ 1 ] )
    @render = @group.render
    @options = @render.scan( /<option[^>]*>[^<]+<\/option>/ )
    @green_option = @options.find{|o|o.include?( ">Green<" )}
    @red_option = @options.find{|o|o.include?( ">Red<" )}
  end

  it "should render select tag" do
    @render.should.include( "<select" )
  end

  it "should render option tags" do
    @render.should.include( "<option" )
  end

  it "should have Green option" do
    assert_not_nil( @green_option )
  end

  it "should have Green option with value = 1" do
    @green_option.should.include( "value='1'" )
  end

  it "should have Red option with value = 2" do
    @red_option.should.include( "value='2'" )
  end

  it "should render selected Green option" do
    @green_option.should.include( "selected" )
  end

  it "should render unselected Red option" do
    @red_option.should.not.include( "selected" )
  end
end
