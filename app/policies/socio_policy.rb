SocioPolicy = Struct.new(:user, :socio) do
  def method_missing *args
    user.tiene_rol? :administrador
  end
end
