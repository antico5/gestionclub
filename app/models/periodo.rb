class Periodo < ActiveRecord::Base

  has_many :costo_por_categorias
  has_many :deudas
  
  def generar_deuda_a_socios_activos
    #obtener todos los socios activos
    Socio.activos.each do |socio|
      Deuda.generar self, socio
    end
  end
  
end
