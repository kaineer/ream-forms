require 'ream/form/input_group'

module Ream::Form
  class CheckboxGroup < InputGroup
    include Ream::Form::Html

    def initialize( name = nil, values = [], opts = {} )
      super( name, :checkbox_group, values, opts )
    end

    def render
      @inputs = []
      render_items
      @inputs.map( &:render ).join
    end

    def render_item( value )
      opts = {}
      opts[ :checked ] = self.selected.include?( value.first )
      @inputs << Checkbox.new( @name + "[]", value.first, opts )
    end
  end
end
