class Socio < ActiveRecord::Base
  include SociosHelper

  before_save :inicializar

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

  def inicializar
  	self.activo ||= true #el operador ||= setea un valor al especificado solo si era nil
  	self.fecha_alta ||= Date.today.to_date
  end

  def saldo_cuenta
    total_deudas = deudas.sum(:monto)
    total_pagos = pagos.sum(:monto)
    total_deudas - total_pagos
  end

  def listar_cuenta_corriente
    listado = []
    deudas.each do |deuda|
      listado << RenglonCuenta.new(fecha: deuda.created_at, concepto: deuda.concepto, haber: deuda.monto)
    end
    pagos.each do |pago|
      listado << RenglonCuenta.new(fecha: pago.created_at, concepto: pago.concepto, debe: pago.monto)
    end
    listado.sort! {|a,b| a.fecha <=> b.fecha}
    listado
  end

  delegate :monto_por_periodo, to: :categoria, prefix: false, allow_nil: true

end
