class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :nombre
      t.integer :edad_hasta

      t.timestamps
    end
  end
end
