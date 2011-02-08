require 'ream/form/input_group'

module Ream::Form
  class RadioGroup < InputGroup
    def initialize( name = nil, values = [], opts = {} )
      values = [ values ] unless values.is_a?( Array )
      super( name, :radio_group, values, opts )
    end

    def append_item( value )
      @inputs << Input.new( @name + "[]", :radio, value.first, item_opts( value ) )
    end
  end
end
