class AddForeignKeysToSocio < ActiveRecord::Migration
  def change
    add_column :socios, :categoria_id, :integer
  end
end
