require 'ream/form/input_group'

module Ream::Form
  class Select < InputGroup
    def initialize( name = nil, values = [], opts = {} )
      super( name, :select, values, opts )
    end

    def render
      @tag = tag( "select" )
      render_items
      
      @tag.render
    end

    def render_item( value )
      tag = @tag.tag( "option" )
      tag.attr( :value, value.first ).text( value.last )
      tag.attr( :selected, "selected" ) if selected.include?( value.first )
    end
  end
end
