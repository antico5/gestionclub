require 'spec_helper'

describe Deuda do

  before do
    @socio = create :socio
    @periodo = create :periodo
    @periodo_vencido = create :periodo_vencido
    @deuda = create :deuda, socio: @socio, periodo: @periodo
  end

  it "No permite duplicados con el mismo periodo y socio" do
    deuda_duplicada = Deuda.create socio: @socio, periodo: @periodo
    expect(deuda_duplicada).to_not be_valid
  end

  it "Sabe cuando esta vencida" do
    deuda_vencida = Deuda.create monto: 50, periodo: @periodo_vencido# falta completar aca
    expect(deuda_vencida.vencida?).to be_true
  end

  it "Sabe cuando no esta vencida" do
    deuda_no_vencida = Deuda.create monto: 50, periodo: @periodo
    expect(deuda_no_vencida.vencida?).to be_false
  end

end
