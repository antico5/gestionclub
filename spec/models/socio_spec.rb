require 'spec_helper'

describe Socio do

  before :each do
    periodo = create :periodo
    @socio = Socio.create! nombre: "Juan", dni: "23423", categoria: Categoria.first
    deuda = @socio.generar_deuda periodo
    pago = Pago.create deuda: deuda, monto: 60
  end

  it "Calcula el saldo de su cuenta" do
    expect(@socio.saldo_cuenta).to eq(40)
  end

  it "Devuelve el listado de su cuenta corriente" do
    expect(@socio.listar_cuenta_corriente.size).to eq(2)
  end
end
