require 'ream/form/input_group'

module Ream::Form
  class CheckboxGroup < InputGroup
    include Ream::Form::Html

    def initialize( name = nil, values = [], opts = {} )
      super( name, :checkbox_group, values, opts )
    end

    def append_item( value )
      @inputs << Checkbox.new( @name + "[]", value.first, item_opts( value ) )
    end
  end
end
