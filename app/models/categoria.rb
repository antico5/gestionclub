class Categoria < ActiveRecord::Base
  has_many :socios
  has_many :costo_por_categorias
end
