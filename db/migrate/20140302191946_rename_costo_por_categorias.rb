class RenameCostoPorCategorias < ActiveRecord::Migration
  def change
    rename_table :costo_por_categoria, :costo_por_categorias
  end
end
