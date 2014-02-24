class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :usuario
      t.string :nombre
      t.string :password

      t.timestamps
    end
  end
end
