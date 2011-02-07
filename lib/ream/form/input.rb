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

      def self.acceptable_attributes
        @attributes ||= [ :id, :class, :style, :size, :length ]
      end

      def render
        @tag = tag( "input" )
        name_attribute
        value_attribute
        type_attribute
        html_attributes
        @tag.render
      end

      def value
        if @form && @form.has_object? && @name.is_a?( Symbol ) && @value.to_s == ""
          @form.object.send( @name )
        else
          @value
        end
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

      def html_attributes
        @attributes = self.class.acceptable_attributes.map do |key|
          @tag.attr( key.to_s, @opts[ key ] ) if @opts[ key ] 
        end.compact * 32.chr

=begin
        @attributes = self.class.acceptable_attributes.map do |key|
          @opts[ key ] ? "#{key.to_s}='#{@opts[key]}'" : nil
        end.compact * 32.chr

        @attributes == "" ? nil : @attributes
=end
      end

      attr_reader :type
    end
  end
end
