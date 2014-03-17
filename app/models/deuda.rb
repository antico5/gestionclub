class Deuda < ActiveRecord::Base
  after_initialize :init

  belongs_to :socio
  belongs_to :periodo
  has_many :pagos

  validates_uniqueness_of :socio_id, scope: :periodo_id
  validates_numericality_of :monto, greater_than: 0

  scope :impagas, -> {where(pagada: false)}

  def init
    if new_record?
      self.pagada = false
    end
  end

  def concepto
    "Cuota: " + periodo.nombre
  end

  def monto_pagado
  	pagos.sum('monto')
  end

  def monto_pendiente
    monto - monto_pagado
  end

  def vencida?
    fecha_vencimiento and fecha_vencimiento < Date.today
  end

  def fecha_vencimiento
    periodo.fecha_vencimiento
  end

end
