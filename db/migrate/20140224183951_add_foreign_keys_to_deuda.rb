class AddForeignKeysToDeuda < ActiveRecord::Migration
  def change
    add_column :deudas, :socio_id, :integer
    add_index :deudas, :socio_id
    add_column :deudas, :periodo_id, :integer
    add_index :deudas, :periodo_id
  end
end
