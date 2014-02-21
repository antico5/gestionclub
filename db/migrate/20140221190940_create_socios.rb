class CreateSocios < ActiveRecord::Migration
  def change
    create_table :socios do |t|
      t.string :nombre
      t.string :dni
      t.string :domicilio
      t.string :email
      t.date :fecha_alta
      t.date :fecha_baja
      t.text :comentario
      t.boolean :activo

      t.timestamps
    end
  end
end
