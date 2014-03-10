class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable

  belongs_to :rol

  def cajero?
    rol.nombre == "Cajero"
  end

  def administrador?
    rol.nombre == "Administrador"
  end
end
