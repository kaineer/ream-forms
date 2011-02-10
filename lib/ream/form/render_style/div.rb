require 'ream/form/render_style/base'

module Ream::Form::RenderStyle
  class Div

    include Ream::Form::Html

    def render_form_content( raw_html, opts = {} )
      tag( "div", :class => "form" ) do |f|
        f.html( raw_html )
      end.render
    end

    def render_input( raw_html, opts = {} )
      tag( "div", :class => "row" ) do |t|
        t.tag( "div", :class => "label" ) do |l|
          l.tag( "label" ) do |lt|
            lt.attr( :for, opts[ :id ] ) if opts[ :id ]
            lt.text( opts[ :label ] )
          end
        end
        t.tag( "div", :class => "input" ) do |i|
          i.html( raw_html )
        end
      end.render
    end

    def render_input_group( raw_html, opts = {} )
      render_input( raw_html, opts )
    end

    def render_input_group_item( raw_html, opts = {} )
      tag( "div", :class => "item" ) do |t|
        t.html( raw_html )
        t.tag( "label", :for => "#{opts[ :id ]}_#{opts[ :value ]}" ) do |l|
          l.text( opts[ :title ] )
        end
      end.render
    end
  end
end
