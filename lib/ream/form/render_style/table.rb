require 'ream/form/render_style/base'

module Ream::Form::RenderStyle
  class Table

    include Ream::Form::Html

    def render_form_content( raw_html, opts = {} )
      t = tag( "table" )
      t.render_open_tag +
        raw_html +
        t.render_close_tag
    end
    
    def render_input( raw_html, opts = {} )
      tag( "tr" ) do |tr|
        tr.tag( "td" ) do |td|
          td.tag( "label" ) do |l|
            l.text( opts[ :label ] )
            l.attr( "for", opts[ :id ] ) if opts[ :id ]
          end
        end
        tr.tag( "td" ) do |td|
          td.text( raw_html )
        end
      end.render 
    end

    def id_attribute( opts = {} )
      opts[ :id ] ? " id='#{opts[:id]}'" : ""
    end

    def render_input_group( raw_html, opts = {} )
puts "*** render_input_group with #{raw_html.inspect}"
      render_input( raw_html, opts )
    end
  end
end
