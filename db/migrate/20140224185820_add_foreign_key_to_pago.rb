class AddForeignKeyToPago < ActiveRecord::Migration
  def change
    add_column :pagos, :deuda_id, :integer
    add_index :pagos, :deuda_id
  end
end
