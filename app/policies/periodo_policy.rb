PeriodoPolicy = Struct.new(:user, :periodo) do
  def method_missing *args
    user.administrador?
  end
end
