CajaControllerPolicy = Struct.new(:user, :dummy) do
  def method_missing *args
    user.cajero?
  end
end
