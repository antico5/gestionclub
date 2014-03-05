class Deuda < ActiveRecord::Base
  after_initialize :init

  belongs_to :socio
  belongs_to :periodo
  has_many :pagos

  validates_uniqueness_of :socio_id, scope: :periodo_id
  validates_numericality_of :monto, greater_than: 0

  def monto_pagado
  	pagos.sum('monto')
  end

  def init
    self.pagada = false
  end

  def concepto
    "Cuota: " + periodo.nombre
  end

end
