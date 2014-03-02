require 'spec_helper'

describe Socio do
  it "Calcula el saldo de su cuenta" do
    periodo = create :periodo
    socio = Socio.create! nombre: "Juan", dni: "23423", categoria_id: 1
    deuda = socio.generar_deuda periodo
    pago = Pago.create deuda: deuda, monto: 60
    expect(socio.saldo_cuenta).to eq(40)
  end
end
