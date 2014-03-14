CajaControllerPolicy = Struct.new(:user, :dummy) do
  def method_missing *args
    Rol.check_rol user, :cajero
  end
end
