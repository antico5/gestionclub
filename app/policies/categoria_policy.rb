CategoriaPolicy = Struct.new(:user, :categoria) do
  def method_missing *args
    user.administrador?
  end
end
