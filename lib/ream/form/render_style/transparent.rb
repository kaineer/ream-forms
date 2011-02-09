require 'ream/form/render_style/base'

module Ream::Form::RenderStyle
  class Transparent < Base
    def render_form_content( raw_html, opts = {} )
      raw_html
    end

    def render_input( raw_html, opts = {} )
      raw_html
    end

    def render_input_group( raw_html, opts = {} )
      raw_html
    end

    def render_input_group_item( raw_html, opts = {} ) 
      raw_html
    end
  end
end
