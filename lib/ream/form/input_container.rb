module Ream::Form
  module InputContainer
    def append_items
      self.values.each do |value|
        append_item( value )
      end
    end

    def values
      self.value || []
    end

    def selected
      @opts[ :selected ] || []
    end
  end
end
