#
module Ream
  module Form
    class Input
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
        [ "<input",
          name_attribute,
          type_attribute,
          value_attribute,
          html_attributes,
          "/>" ].compact * 32.chr
      end

      def value
        if @form && @form.has_object? && @name.is_a?( Symbol ) && @value.to_s == ""
          @form.object.send( @name )
        else
          @value
        end
      end

      def type_attribute
        "type='#{@type}'"
      end

      def name_attribute
        case @name
        when String then "name='#{@name}'"
        when Symbol
          if @form && @form.object_string
            "name='#{@form.object_string}[#{@name.to_s}]'"
          else
            nil
          end
        when NilClass then nil
        end
      end

      def value_attribute
        value.to_s == "" ? nil : "value='#{self.value.to_s}'"
      end

      def html_attributes
        @attributes = self.class.acceptable_attributes.map do |key|
          @opts[ key ] ? "#{key.to_s}='#{@opts[key]}'" : nil
        end.compact * 32.chr

        @attributes == "" ? nil : @attributes
      end

      attr_reader :type
    end
  end
end
