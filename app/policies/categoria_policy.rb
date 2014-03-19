CategoriaPolicy = Struct.new(:user, :categoria) do
  def method_missing *args
    user.tiene_rol? :administrador
  end
end
