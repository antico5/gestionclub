class AddRolIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :rol_id, :integer
  end
end
