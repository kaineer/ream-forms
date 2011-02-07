require 'ream/form/input'

module Ream
  module Form
    class InputGroup < Input
      def initialize( name = nil, type = :select, values = [], opts = {} )
        super( name, type, values, opts )
        raise "Value for #{self.class.name} should be array" unless values.is_a?( Array )
      end

      def values
        self.value || []
      end

      def selected
        @opts[ :selected ] || []
      end

      def render
        @tag = tag( "select" ) do |t|
          self.values.each do |value|
            render_item( value )
          end 
        end
        
        @tag.render
      end

      def render_items
        self.values.each do |value|
          render_item( value )
        end 
      end

      def render_group( &block )
        if @form && @form.render_style
          @form.render_style.render_group( self, &block )
        else
          render_preamble +
            block.call +
            render_postamble
        end
      end

      def render_content
        if @form && @form.render_style
          @form.render_style.render_group_items( self.value, selected, &block )
        else
          self.value.each do |v|
            render_item( v )
          end
        end
      end

      def render_item( v )
      end
    end
  end
end
