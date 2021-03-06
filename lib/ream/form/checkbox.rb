require 'ream/form/input'

module Ream::Form
  class Checkbox < Input
    def initialize( name = nil, value = "", opts = {} )
      super( name, :checkbox, value, opts )
    end

    def checked
      @checked = opts[ :checked ] if @checked.nil?
      @checked
    end

    def set_attributes
      name_attribute
      value_attribute
      checked_attribute
      type_attribute
      html_attributes
    end

    def checked_attribute
      @tag.attr( :checked, "checked" ) if self.checked
    end
  end
end
