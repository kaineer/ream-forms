require 'ream/form/input'

module Ream
  module Form
    class InputGroup < Input
      def initialize( name = nil, type = :select, values = [], opts = {} )
        super( name, type, values, opts )
      end
    end
  end
end
