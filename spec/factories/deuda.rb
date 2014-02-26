FactoryGirl.define do
  factory :deuda do
    monto 100
    pagada false
    socio
    periodo
  end
end
