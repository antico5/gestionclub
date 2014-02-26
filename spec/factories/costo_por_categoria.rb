FactoryGirl.define do
  factory :costo_por_categoria, class: CostoPorCategoria do
  	periodo
  	categoria
  	costo 100
  end
end
