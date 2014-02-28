class Deuda < ActiveRecord::Base
  
  belongs_to :socio
  belongs_to :periodo
  has_many :pagos

  validates_uniqueness_of :socio_id, scope: :periodo_id
  
  def self.generar(periodo,socio)
    monto = monto_por_categoria(periodo,socio.categoria)
    create(periodo: periodo, socio: socio, monto: monto) if monto > 0 
  end
  
  def monto_pagado
  	return pagos.sum('monto')
  end
  
  #devuelve el monto (float) de la cuota para la categoria pasada como parametro  
  def self.monto_por_categoria(periodo,categoria)
    #obtener la instancia de CostoPorCategoria asociada a esa categoria
    costo_por_categoria = periodo.costo_por_categorias.where(categoria: categoria).first
    if costo_por_categoria != nil
      return costo_por_categoria.costo
    else
      return 0
    end
  end
  
end
