class Socio < ActiveRecord::Base

  after_initialize :init

  belongs_to :categoria
  has_many :deudas
  has_many :pagos, through: :deudas

  validates :categoria, presence: true
  validates :nombre, presence: true
  validates :dni, presence: true, uniqueness: true

  scope :activos, -> {where(activo: true)}

  def generar_deuda periodo
    monto = monto_por_periodo periodo
    Deuda.create(socio: self, periodo: periodo, monto: monto)
  end

  def init
  	activo ||= true #el operador ||= setea un valor al especificado solo si era nil
  	fecha_alta = Date.today.to_date
  end

  def saldo_cuenta
    total_deudas = deudas.sum(:monto)
    total_pagos = pagos.sum(:monto)
    total_deudas - total_pagos
  end

  delegate :monto_por_periodo, to: :categoria, prefix: false, allow_nil: true

end
