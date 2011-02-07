require 'ream/form/input_group'

module Ream
  module Form
    class Select < InputGroup
      def initialize( name = nil, values = [], opts = {} )
        super( name, :select, values, opts )
      end

      def render
        @tag = tag( "select" ) do |t|
          self.values.each do |v|
            _tag = t.tag( "option" ).
              attr( :value, v.first ).
              text( v.last )

            _tag.attr( :selected, "selected" ) if selected.include?( v.first )
          end 
        end
        
        @tag.render
      end
    end
  end
end
