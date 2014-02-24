class CreateCostoPorCategoria < ActiveRecord::Migration
  def change
    create_table :costo_por_categoria do |t|
      t.float :costo

      t.timestamps
    end
  end
end
