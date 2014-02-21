require 'spec_helper'

describe "socios/show" do
  before(:each) do
    @socio = assign(:socio, stub_model(Socio,
      :nombre => "Nombre",
      :dni => "Dni",
      :domicilio => "Domicilio",
      :email => "Email",
      :comentario => "MyText",
      :activo => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
    rendered.should match(/Dni/)
    rendered.should match(/Domicilio/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
