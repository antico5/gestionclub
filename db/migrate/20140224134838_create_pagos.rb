class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.float :monto
      t.date :fecha

      t.timestamps
    end
  end
end
