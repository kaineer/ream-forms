require 'ream/form/input'

module Ream::Form
  class Textarea < Input
    def initialize( name = nil, value = "", opts = {} )
      super( name, :textarea, value, opts )
    end

    def render
      @tag = tag( "textarea" ).text( value.to_s ).close_tag
      name_attribute
      html_attributes
      @tag.render
    end
  end
end
