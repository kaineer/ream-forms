module Ream
  module Form
    class Form
      def initialize( action, http_method = "POST", opts = {}, &block )
        @action, @http_method, @opts = action, http_method, opts
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
        case action
        when String   then "action='#{action}'"
        when Symbol   then "action='/#{action.to_s}/update'"
        else "action='/#{action_class_name}/update/#{action.id}"
        end
      end

      def action_class_name
        @action.class.name.scan( /[A-Z]*[a-z]+/ ).map( &:downcase ) * "_"
      end

      def object_string
        case @action
        when Symbol then @action.to_s
        when String then nil
        when NilClass then nil
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
