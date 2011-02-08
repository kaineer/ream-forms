require 'ream/form/input_group'

module Ream::Form
  class RadioGroup < InputGroup
    include Ream::Form::Html

    def initialize( name = nil, values = [], opts = {} )
      values = [ values ] unless values.is_a?( Array )
      super( name, :radio_group, values, opts )
    end

    def append_item( value )
      opts = {}
      opts[ :checked ] = self.selected.include?( value.first )
      @inputs << Input.new( @name + "[]", :radio, value.first, opts )
    end
  end
end
