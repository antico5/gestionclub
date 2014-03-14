class Rol < ActiveRecord::Base
  NOMBRES = {cajero: "Cajero", administrador: "Administrador", super_admin: "Super Admin", no_asignado: "No asignado"}

  has_many :users

  def self.new_user_role
    self.obtener :no_asignado
  end

  def self.check_rol user, rol
    instancia_rol = self.obtener rol
    user.rol == instancia_rol
  end

  def self.nombre rol
    NOMBRES[rol]
  end

  def self.obtener rol
    Rol.find_by(nombre: self.nombre(rol))
  end

end
