SocioPolicy = Struct.new(:user, :socio) do
  def method_missing *args
    user.administrador?
  end
end
