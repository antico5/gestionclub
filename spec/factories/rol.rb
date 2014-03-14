FactoryGirl.define do
  factory :admin, class: Rol do
    nombre "Administrador"
  end

  factory :cajero, class: Rol do
    nombre "Cajero"
  end

  factory :super_admin, class: Rol do
    nombre "Super Admin"
  end

end
