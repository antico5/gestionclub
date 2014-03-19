PeriodoPolicy = Struct.new(:user, :periodo) do
  def method_missing *args
    user.tiene_rol? :administrador
  end
end
