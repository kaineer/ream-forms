require 'ream/form/html'
#
module Ream
  module Form
    class Input
      include Html

      def initialize( name = nil, type = :text, value = "", opts = {} )
        @name, @type, @value, @opts = name, type, value, opts
        @form = nil

        if @value.is_a?( Hash )
          @opts, @value = @value, nil
        end
      end

      attr_writer :form
      attr_reader :opts
      attr_reader :type


      def render_style
        @form ? @form.render_style : nil
      end

      def render
        unless @tag
          @tag = tag( "input" )
          set_attributes
        end
        
        render_using_style
      end

      def value
        if @form && @form.has_object? && @name.is_a?( Symbol ) && @value.to_s == ""
          @form.object.send( @name )
        else
          @value
        end
      end

      def title
        @opts[ :title ] || "Checkbox"
      end


    protected

      def render_without_style
        @tag.render
      end
      
      def render_using_style
        if render_style
          render_style.
            render_input( render_without_style, @opts )
        else
          render_without_style
        end
      end

      def set_attributes
        name_attribute
        value_attribute
        type_attribute
        html_attributes
      end

      def type_attribute
        @tag.attr( "type", @type )
      end

      def name_attribute
        case @name
        when String then @tag.attr( "name", @name )
        when Symbol
          if @form && @form.object_string
            @tag.attr( "name", "#{@form.object_string}[#{@name.to_s}]" )
          else
            nil
          end
        when NilClass then nil
        end
      end

      def value_attribute
        @tag.attr( "value", self.value.to_s ) unless value.to_s == ""
      end


      def self.acceptable_attributes
        @attributes ||= [ :id, :class, :style, :size, :length ]
      end

      def html_attributes
        @attributes = self.class.acceptable_attributes.map do |key|
          @tag.attr( key.to_s, @opts[ key ] ) if @opts[ key ] 
        end.compact * 32.chr
      end
    end
  end
end
