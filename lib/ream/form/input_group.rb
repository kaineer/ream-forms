require 'ream/form/input'
require 'ream/form/input_container'

module Ream
  module Form
    class InputGroup < Input

      include InputContainer
      
      def initialize( name = nil, type = :select, values = [], opts = {} )
        super( name, type, values, opts )
        raise "Value for #{self.class.name} should be array" unless values.is_a?( Array )
      end

      def render
        unless @inputs
          @inputs = []
          append_items
        end
        @inputs.map( &:render ).join
      end

      def item_opts( value )
        { :checked => self.selected.include?( value.first ) }
      end

      def append_item( value )
        raise "Class #{self.class.name} has no render_item method"
      end
    end
  end
end
