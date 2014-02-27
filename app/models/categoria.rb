class Categoria < ActiveRecord::Base
  has_many :socios
  has_many :costo_por_categorias
  
  def to_s
     nombre
  end
end
