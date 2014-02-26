class Socio < ActiveRecord::Base
  
  after_initialize :init
  
  belongs_to :categoria
  has_many :deudas
  
  validates :categoria, presence: true
  validates :nombre, presence: true
  validates :dni, presence: true
  
  def init
  	activo ||= true #el operador ||= setea un valor al especificado solo si era nil
  end
  
end
