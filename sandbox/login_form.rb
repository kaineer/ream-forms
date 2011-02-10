$:.unshift( File.join( File.dirname( __FILE__ ), "../lib" ) )

require 'ream/form'

class LoginForm < Ream::Form::Form
  def initialize( user_object = nil )
    super( "/login" ) do |f|
      f.text( "login[name]", ( user_object.name rescue "" ), :id => "login_id", :label => "Login" )
      f.password( "login[password]", :id => "login_password", :label => "Password" )
      f.submit( "Ok" )
    end
  end

  def render_style
    @render_style ||= Ream::Form::RenderStyle::Table.new
  end
end

# Usage:
#
# in controller: @form = LoginForm.new( user )
#
# in view: = @form.render

if $0 == __FILE__
  require 'ream/form/render_style'
  require 'ostruct'
  
  puts LoginForm.new( OpenStruct.new( "name" => "user_name" ) ).render
end
