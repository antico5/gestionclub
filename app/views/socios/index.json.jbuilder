json.array!(@socios) do |socio|
  json.extract! socio, :id, :nombre, :dni, :domicilio, :email, :fecha_alta, :fecha_baja, :comentario, :activo
  json.url socio_url(socio, format: :json)
end
