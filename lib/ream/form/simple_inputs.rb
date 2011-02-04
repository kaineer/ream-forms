require 'ream/form/input'

module Ream
  module Form
    class Text < Input
      def initialize( name = nil, value = "", opts = {} )
        super( name, :text, value, opts )
      end
    end

    class Password < Input
      def initialize( name = nil, value = "", opts = {} )
        super( name, :password, value, opts )
      end
    end

    class Hidden < Input
      def initialize( name = nil, value = "", opts = {} )
        super( name, :hidden, value, opts )
      end
    end
  end
end
