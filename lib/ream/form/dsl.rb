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

      def submit( value = "", opts = {} )
        self << Submit.new( value, opts )
      end

      def textarea( name = nil, value = "", opts = {} )
        self << Textarea.new( name, value, opts )
      end

      # Selected values go in opts[ :selected ]
      #
      def select( name = nil, values = "", opts = {} )
        self << Select.new( name, values, opts )
      end
    end
  end
end
