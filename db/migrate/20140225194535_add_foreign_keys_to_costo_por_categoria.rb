class AddForeignKeysToCostoPorCategoria < ActiveRecord::Migration
  def change
    add_column :costo_por_categoria, :categoria_id, :integer
    add_column :costo_por_categoria, :periodo_id, :integer
  end
end
