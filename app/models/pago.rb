class Pago < ActiveRecord::Base

  after_save :actualizar_deuda

  belongs_to :deuda

  private

    def actualizar_deuda
      if deuda.monto_pagado >= deuda.monto
        deuda.pagada = true
        deuda.save
      end
    end
end
