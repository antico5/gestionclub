PagoPolicy = Struct.new(:user, :dummy) do
  def method_missing *args
    user.tiene_rol? :cajero
  end
end
