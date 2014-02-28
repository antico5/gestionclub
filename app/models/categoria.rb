class Categoria < ActiveRecord::Base
  has_many :socios
  has_many :costo_por_categorias
  
  def monto_por_periodo periodo
    costo_por_categorias.where(periodo: periodo).first.costo
  end
  
  def to_s
     nombre
  end
end
