# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Categoria.count == 0
  Categoria.create nombre: "Niño"
  Categoria.create nombre: "Adulto"
  Categoria.create nombre: "Jubilado"
  Categoria.create nombre: "Anexo Grupo Familiar"
end

if Rol.count == 0
  Rol::NOMBRES.values.each {|rol| Rol.create nombre: rol}
end
