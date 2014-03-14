CategoriaPolicy = Struct.new(:user, :categoria) do
  def method_missing *args
    Rol.check_rol user, :administrador
  end
end
