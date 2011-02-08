require 'ream/form/input_group'

module Ream::Form
  class RadioGroup < InputGroup
    include Ream::Form::Html

    def initialize( name = nil, values = [], opts = {} )
      values = [ values ] unless values.is_a?( Array )
      super( name, :radio_group, values, opts )
    end

    # NOTE: same as in CheckboxGroup
    def render
      @inputs = []
      render_items
      @inputs.map( &:render ).join
    end

    def render_item( value )
      opts = {}
      opts[ :checked ] = self.selected.include?( value.first )
      @inputs << Input.new( @name + "[]", :radio, value.first, opts )
    end
  end
end
