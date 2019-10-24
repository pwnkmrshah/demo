class CreateUsers < ActiveRecord::Migration[5.0]
   def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone, limit: 8 
      t.string :password
      t.timestamps
    end
  end

  def self.down
    drop_table users
  end
end
