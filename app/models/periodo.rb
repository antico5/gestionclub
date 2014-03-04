class Periodo < ActiveRecord::Base

  has_many :costo_por_categorias
  has_many :deudas
  has_many :categorias, through: :costo_por_categorias

  accepts_nested_attributes_for :costo_por_categorias

  before_create :init

  def init
    Categoria.all.each do |cat|
      costo_por_categorias.build categoria: cat, costo: 0
    end
  end

  def generar_deuda_a_socios_activos
    #obtener todos los socios activos
    Socio.activos.each do |socio|
      socio.generar_deuda self
    end
  end

end
