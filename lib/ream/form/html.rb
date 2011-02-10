module Ream::Form
  module Html
    class Tag
      def initialize( name = nil, attributes = {}, &block )
        @name = name
        @attributes = attributes
        @close_tag = false

        @items = []
        block.call( self ) if block_given?
      end

      # Dsl part
      #
      def attr( key, value )
        @attributes[ key ] = value
        self
      end

      def close_tag
        @close_tag = true
        self
      end

      def name( _name = nil )
        @name = _name if _name
        @name
      end

      def text( _text )
        @items << _text
        self
      end

      def html( _html )
        @items << _html
        self
      end

      def tag( name, attributes = {}, &block )
        _tag = Tag.new( name, attributes, &block )
        @items << _tag
        _tag
      end

      # Render part
      #
      def render
        @name ? render_tag : ""
      end

      def render_tag
        @close_tag || has_content? ? ( render_open_tag + render_content + render_close_tag ) : render_empty_tag
      end

      def has_content?
        !@items.empty?
      end

      def render_tag_with_attributes
        "<" +
          [ @name.to_s,
            render_attributes ].compact * 32.chr
      end

      def render_open_tag
        render_tag_with_attributes + ">"
      end

      def render_content
        @items.map do |item|
          item.is_a?( Tag ) ? item.render : item.to_s
        end.join
      end
      
      def render_empty_tag
        render_tag_with_attributes + "/>"
      end

      def render_close_tag
        "</#{@name}>"
      end

      def render_attributes
        return nil if @attributes.empty?
        @attributes.map{|k,v|"#{k}='#{v}'"} * 32.chr
      end
    end
    
    def tag( name = nil, attributes = {}, &block )
      Tag.new( name, attributes, &block )
    end

    def empty_tag( name = nil, attributes = {} )
      Tag.new( name, attributes )
    end
  end
end
