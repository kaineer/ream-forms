require 'ream/form'

context "Default form" do
  setup do
    @form = Ream::Form.new( "/" )
  end

  it "should have method POST by default" do
    @form.http_method.should.be == "POST"
  end
end
