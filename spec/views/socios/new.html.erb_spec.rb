require 'spec_helper'

describe "socios/new" do
  before(:each) do
    assign(:socio, stub_model(Socio,
      :nombre => "MyString",
      :dni => "MyString",
      :domicilio => "MyString",
      :email => "MyString",
      :comentario => "MyText",
      :activo => false
    ).as_new_record)
  end

  it "renders new socio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", socios_path, "post" do
      assert_select "input#socio_nombre[name=?]", "socio[nombre]"
      assert_select "input#socio_dni[name=?]", "socio[dni]"
      assert_select "input#socio_domicilio[name=?]", "socio[domicilio]"
      assert_select "input#socio_email[name=?]", "socio[email]"
      assert_select "textarea#socio_comentario[name=?]", "socio[comentario]"
      assert_select "input#socio_activo[name=?]", "socio[activo]"
    end
  end
end
