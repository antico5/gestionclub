FactoryGirl.define do
  factory :deuda do
    monto 100
    pagada false
    association :socio
    association :periodo
  end
end