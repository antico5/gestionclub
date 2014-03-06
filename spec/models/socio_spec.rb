require 'spec_helper'

describe Socio do

  before :each do
    periodo = create :periodo
    @socio = Socio.create! nombre: "Juan", dni: "23423", categoria: Categoria.first
    deuda = @socio.generar_deuda periodo
    pago = Pago.create deuda: deuda, monto: 60
  end

  describe "Calculo de cuenta corriente" do

    it "Calcula el saldo de su cuenta" do
      expect(@socio.saldo_cuenta).to eq(40)
    end

    it "tiene un renglon por cada deuda y pago" do
      expect(@socio.listar_cuenta_corriente.size).to eq(2)
    end

    it "contiene el monto de las deudas en haber" do
      expect(@socio.listar_cuenta_corriente[0].haber).to eq(100)
    end

    it "contiene el monto de los pagos en debe" do
      expect(@socio.listar_cuenta_corriente[1].debe).to eq(60)
    end

    it "contiene un concepto para deuda" do
      expect(@socio.listar_cuenta_corriente[0].concepto).to eq("Cuota: Febrero 2014")
    end

    it "contiene un concepto para pago" do
      expect(@socio.listar_cuenta_corriente[1].concepto).to eq("Pago de Cuota: Febrero 2014")
    end

  end
end
