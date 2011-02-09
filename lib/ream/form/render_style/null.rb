require 'ream/form/render_style/base'

module Ream::Form::RenderStyle
  class Null < Base
    def render_form_content( raw_html, opts = {} )
      ""
    end

    def render_input( raw_html, opts = {} )
      ""
    end

    def render_input_group( raw_html, opts = {} )
      ""
    end

    def render_input_group_item( raw_html, opts = {} ) 
      ""
    end
  end
end
