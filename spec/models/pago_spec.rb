require 'spec_helper'

describe Pago do

  it "Setea la deuda como pagada cuando la suma de los pagos la cubren" do
    deuda = create :deuda # crea una deuda de 100 pesos
    Pago.create! deuda: deuda, monto: 50
    Pago.create! deuda: deuda, monto: 50
    expect(deuda.pagada).to be_true
  end
  
  it "Debe quedar impaga cuando se hace un pago insuficiente" do
    deuda = create :deuda
    Pago.create! deuda: deuda, monto: 50
    expect(deuda.pagada).to be_false
  end
    
end
