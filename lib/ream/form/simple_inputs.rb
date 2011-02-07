require 'ream/form/input'

module Ream::Form
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

  class Submit < Input
    def initialize( value = "", opts = {} )
      super( opts[ :name ], :submit, value, opts )
    end
  end
end
