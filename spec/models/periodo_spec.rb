require 'spec_helper'

describe Periodo do
  it "Genera una deuda para todos los socios activos cada vez que se genera un periodo" do
  	socio = create :socio
  	periodo = create :periodo
  	
  	deudas_del_periodo = periodo.deudas
  	expect(deudas_del_periodo.count).to_not eq(0)
  	
  end
  
  
  
end
