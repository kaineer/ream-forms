module Ream::Form
  module RenderStyle
    class Base
      def render_form_content( raw_html, opts = {} )
        raise "Style #{self.class.name} has no #render_form_content method!"
      end

      def render_input( raw_html, opts = {} )
        raise "Style #{self.class.name} has no #render_input method!"
      end

      def render_input_group( raw_html, opts = {} )
        raise "Style #{self.class.name} has no #render_input_group method!"
      end

      def render_input_group_item( raw_html, opts = {} ) 
        raise "Style #{self.class.name} has no #render_input_group_item method!"
      end
    end
  end
end
