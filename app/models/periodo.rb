class Periodo < ActiveRecord::Base

  has_many :costo_por_categorias
  has_many :deudas
  
  
  def generar_deuda_a_socios_activos
    #obtener todos los socios activos
    socios = Socio.where activo: true
    
    socios.each do |socio|
      #obtener la categoria del socio
      categoria = socio.categoria
      #obtener el monto adecuado para dicha categoria
      monto_deuda = monto_por_categoria(categoria)
      #generar la deuda para el socio
      if monto_deuda != 0
        deuda = Deuda.create periodo: self, socio: socio, monto: monto_deuda
      end
    end
  end
    
  #devuelve el monto (float) de la cuota para la categoria pasada como parametro  
  def monto_por_categoria(categoria)
    #obtener la instancia de CostoPorCategoria asociada a esa categoria
    costo_por_categoria = costo_por_categorias.where(categoria: categoria).first
    if costo_por_categoria != nil
      return costo_por_categoria.costo
    else
      return 0
    end
  end
  
end
