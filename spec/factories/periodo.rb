FactoryGirl.define do
  factory :periodo do
  	nombre "Febrero 2014"
  	fecha_vencimiento Date.today + 2.days
  end
end
