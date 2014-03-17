FactoryGirl.define do
  factory :periodo, class: Periodo do
  	nombre "Febrero 2014"
  	fecha_vencimiento Date.today + 2.days

  	after(:create) do |periodo, evaluator|
      create_list(:costo_por_categoria, 1, periodo: periodo)
    end
  end

  factory :periodo_vencido, class: Periodo do
  	nombre "Febrero 2014"
  	fecha_vencimiento Date.today - 2.days

  	after(:create) do |periodo, evaluator|
      create_list(:costo_por_categoria, 1, periodo: periodo)
    end
  end
end
