require 'ream/form/input'
require 'ream/form/input_container'

module Ream::Form
  class Select < Input

    include InputContainer

    def initialize( name = nil, values = [], opts = {} )
      super( name, :select, values, opts )
    end

    def render
      unless @tag
        @tag = tag( "select" )
        append_items
      end
      @tag.render
    end

    def append_item( value )
      tag = @tag.tag( "option" )
      tag.attr( :value, value.first ).text( value.last )
      tag.attr( :selected, "selected" ) if selected.include?( value.first )
    end
  end
end
