require 'test/spec'
require 'mocha'

require 'redgreen'
# require 'leftright'

$:.unshift( "lib" )

require 'ream/form'
require 'ream/form/render_style'

include Ream::Form

class ::TestForm < Form
  def initialize( render_style = nil )
    super( "/someurl" ) do |f|
      f.submit( "Big submit button", :label => "button-label" )
    end

    @render_style = render_style
  end

  def render_style
    @render_style
  end
end
