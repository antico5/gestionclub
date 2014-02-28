class Socio < ActiveRecord::Base
  
  after_initialize :init
  
  belongs_to :categoria
  has_many :deudas
  
  validates :categoria, presence: true
  validates :nombre, presence: true
  validates :dni, presence: true
  
  scope :activos, where(activo: true)
  
  def generar_deuda periodo
    monto = monto_por_periodo periodo
    Deuda.create(socio: self, periodo: periodo, monto: monto)
  end
  
  def init
  	activo ||= true #el operador ||= setea un valor al especificado solo si era nil
  end
  
  delegate :monto_por_periodo, to: :categoria, prefix: false, allow_nil: true
  
end
