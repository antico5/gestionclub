class CreateDeudas < ActiveRecord::Migration
  def change
    create_table :deudas do |t|
      t.float :monto
      t.boolean :pagada

      t.timestamps
    end
  end
end
