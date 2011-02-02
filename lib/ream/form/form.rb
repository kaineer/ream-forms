module Ream
  class Form
    def initialize( action, http_method = "POST", opts = {}, &block )
      @action, @http_method, @opts = action, http_method, opts
      @block = block
    end

    attr_reader :http_method
  end
end
