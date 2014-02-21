require 'spec_helper'

describe "socios/edit" do
  before(:each) do
    @socio = assign(:socio, stub_model(Socio,
      :nombre => "MyString",
      :dni => "MyString",
      :domicilio => "MyString",
      :email => "MyString",
      :comentario => "MyText",
      :activo => false
    ))
  end

  it "renders the edit socio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", socio_path(@socio), "post" do
      assert_select "input#socio_nombre[name=?]", "socio[nombre]"
      assert_select "input#socio_dni[name=?]", "socio[dni]"
      assert_select "input#socio_domicilio[name=?]", "socio[domicilio]"
      assert_select "input#socio_email[name=?]", "socio[email]"
      assert_select "textarea#socio_comentario[name=?]", "socio[comentario]"
      assert_select "input#socio_activo[name=?]", "socio[activo]"
    end
  end
end
