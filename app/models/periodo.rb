class Periodo < ActiveRecord::Base
  has_many :costo_por_categorias
  has_many :deudas
end
