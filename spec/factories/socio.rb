FactoryGirl.define do
  factory :socio, class: Socio do
  	nombre "Augusto Gonzales"
  	dni "34767762"
  	activo true
  	association :categoria 
  end
end
