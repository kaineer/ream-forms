module Ream
  module Form
    class Form
      def initialize( action, http_method = "POST", opts = {}, &block )
        @action, @http_method, @opts = action, http_method, opts
        if http_method.is_a?( Hash )
          @http_method, @opts = "POST", @http_method
        end
        @inputs = []
        block.call( self ) if block_given?
      end

      def render_style
        nil
      end

      def <<( input )
        @inputs << input
        input.form = self
      end

      def has_object?
        ![ String, Symbol ].include?( @action.class )
      end

      def object
        self.has_object? ? self.action : nil
      end

      attr_reader :http_method
      attr_reader :action

      def render
        "<form #{action_attribute} method='#{http_method}'>" +
          render_content +
          "</form>"
      end

      def action_attribute
        attribute_value = action_attribute_from_hash || action_attribute_from_value
        attribute_value ? "action='#{attribute_value}'" : nil
      end

      def action_attribute_from_hash
        @opts[ :action ]
      end

      def action_attribute_from_value
        case action
        when String   then action.to_s
        when Symbol   then "/#{action.to_s}/update"
        else "/#{action_class_name}/update/#{action.id}"
        end
      end

      def action_class_name
        @action.class.name.scan( /[A-Z]*[a-z]+/ ).map( &:downcase ) * "_"
      end

      def object_string
        case @action
        when Symbol then @action.to_s
        when String, NilClass then nil
        else action_class_name
        end
      end

      def render_content
        render_style ? render_content_with_style : render_content_without_style
      end

      def render_content_with_style
        render_style.render_form_content( render_content_without_style, @opts )
      end

      def render_content_without_style
        @inputs.map do |input|
          input.render 
        end.join
      end
    end
    
    # DSL part
    #
    #
    class << self
      def form( action, http_method = "POST", &block )
        Ream::Form::Form.new( action, http_method, &block )
      end
    end
  end
end
