SocioPolicy = Struct.new(:user, :socio) do
  def method_missing *args
    Rol.check_rol user, :administrador
  end
end
