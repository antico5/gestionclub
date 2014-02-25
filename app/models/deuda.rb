class Deuda < ActiveRecord::Base
  
  belongs_to :socio
  belongs_to :periodo
  has_many :pagos

  validates_uniqueness_of :socio_id, scope: :periodo_id
  
  def monto_pagado
  	return pagos.sum('monto')
  end
  
end
