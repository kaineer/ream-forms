require 'ream/form/input'

module Ream
  module Form
    class Textarea < Input
      def initialize( name = nil, value = "", opts = {} )
        super( name, :textarea, value, opts )
      end

      def render
        "<textarea #{name_attribute}>#{value.to_s}</textarea>"
      end
    end
  end
end
