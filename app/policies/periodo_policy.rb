PeriodoPolicy = Struct.new(:user, :periodo) do
  def method_missing *args
    Rol.check_rol user, :administrador
  end
end
