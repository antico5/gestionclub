class CreatePeriodos < ActiveRecord::Migration
  def change
    create_table :periodos do |t|
      t.string :nombre
      t.date :fecha_vencimiento

      t.timestamps
    end
  end
end
