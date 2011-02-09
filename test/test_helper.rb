require 'test/spec'
require 'mocha'
require 'nokogiri'

require 'redgreen'
# require 'leftright'

$:.unshift( "lib" )

require 'ream/form'
require 'ream/form/render_style'

include Ream::Form

class ::TestForm < Form
  def initialize( render_style = nil )
    super( "/someurl" ) do |f|
      f.submit( "Big submit button", :label => "button-label", :id => "teh_button" )
    end

    @render_style = render_style
  end

  def render_style
    @render_style
  end
end

class ::TestFormWithInputGroup < Form
  def initialize( render_style = nil )
    super( "/someurl" ) do |f|
      f.checkboxes( "test_boxes", [[ 1, "Red" ], [ 2, "Yellow" ], [ 3, "Green" ]], :selected => [ 2 ] )
    end
  end

  def render_style
    @render_style
  end
end
