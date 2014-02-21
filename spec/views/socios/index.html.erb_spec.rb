require 'spec_helper'

describe "socios/index" do
  before(:each) do
    assign(:socios, [
      stub_model(Socio,
        :nombre => "Nombre",
        :dni => "Dni",
        :domicilio => "Domicilio",
        :email => "Email",
        :comentario => "MyText",
        :activo => false
      ),
      stub_model(Socio,
        :nombre => "Nombre",
        :dni => "Dni",
        :domicilio => "Domicilio",
        :email => "Email",
        :comentario => "MyText",
        :activo => false
      )
    ])
  end

  it "renders a list of socios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Dni".to_s, :count => 2
    assert_select "tr>td", :text => "Domicilio".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
