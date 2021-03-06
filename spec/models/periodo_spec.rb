require 'spec_helper'

describe Periodo do

  it "Genera una deuda para todos los socios activos cada vez que se genera un periodo" do
  	periodo = create :periodo
  	#el socio lo creo a pata porque si llamo a create de factorygirl me duplica la categoria
  	socio = Socio.create(nombre: "alberto", dni: "23874", categoria: Categoria.first, activo: true)
  	periodo.generar_deuda_a_socios_activos
  	deudas_del_periodo = periodo.deudas
  	expect(deudas_del_periodo.count).to_not eq(0)
  end

  it "Genera una deuda con el monto apropiado a la categoria del socio" do
    periodo = create :periodo
  	socio = Socio.create(nombre: "alberto", dni: "23874", categoria: Categoria.first, activo: true)
  	periodo.generar_deuda_a_socios_activos
  	monto_correcto = socio.monto_por_periodo periodo
  	deuda_generada = socio.deudas.first
  	monto_generado = deuda_generada.monto
  	expect(monto_generado).to eq(monto_correcto)
  end

  it "Genera una instancia de CostoPorCategoria por cada categoria existente" do
    categoria = create :categoria
    periodo = Periodo.create nombre: "prueba", fecha_vencimiento: Date.today
    expect(periodo.categorias).to eq(Categoria.all)
  end
end
