require 'spec_helper'

describe Rol do
  before :each do
    create :admin
    create :cajero
    create :super_admin
  end

  it "Devuelve el nombre del rol solicitado" do
    nombre = Rol.nombre :cajero
    expect(nombre).to eq("Cajero")
  end

  it "Devuelve instancia del rol solicitado" do
    rol = Rol.obtener :cajero
    expect(rol.nombre).to eq("Cajero")
  end

  it "Chequea el rol de un usuario" do
    user = create :new_user
    user.rol = Rol.obtener :super_admin
    expect(Rol.check_rol user, :super_admin).to be_true
  end

end
