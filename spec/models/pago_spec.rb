require 'spec_helper'

describe Pago do
  it "Setea la deuda como pagada cuando la suma de los pagos la cubren" do
    #deuda = create :deuda
    deuda = Deuda.create! monto:100, pagada: false
    Pago.create! deuda: deuda, monto: 50
    expect(deuda.pagada).to be_false
    Pago.create! deuda: deuda, monto: 50
    expect(deuda.pagada).to be_true
  end
end
