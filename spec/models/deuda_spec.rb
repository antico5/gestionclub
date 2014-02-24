require 'spec_helper'

describe Deuda do

  it "No permite duplicados con el mismo periodo y socio" do
    socio = Socio.create!
    periodo = Periodo.create!
    deuda = Deuda.create! socio: socio, periodo: periodo

    deuda_duplicada = Deuda.create socio: socio, periodo: periodo
    expect(deuda_duplicada).to_not be_valid
  end

end
