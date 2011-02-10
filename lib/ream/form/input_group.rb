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
        
        render_using_style
      end

      def render_using_style
        render_style ? render_with_style : render_without_style
      end

      def render_with_style
        render_style.render_input_group( render_items )
      end

      def render_items
        @inputs.map do |i|
          opts = @opts.merge( :last => @inputs.last.object_id == i.object_id )
          render_style.render_input_group_item( i.render, opts )
        end
      end

      def render_without_style
        @inputs.map( &:render ).join
      end

      def item_opts( value )
        { :checked => self.selected.include?( value.first ) }
      end

      def append_item( value )
        raise "Class #{self.class.name} has no append_item method"
      end
    end
  end
end
