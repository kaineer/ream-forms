module Ream
  module Form
    class Form
      def text( name = nil, value = "", opts = {} )
        self << Text.new( name, value, opts )
      end

      def password( name = nil, value = "", opts = {} )
        self << Password.new( name, value, opts )
      end

      def hidden( name = nil, value = "", opts = {} )
        self << Hidden.new( name, value, opts )
      end
    end
  end
end
