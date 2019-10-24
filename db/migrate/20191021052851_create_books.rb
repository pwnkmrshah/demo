class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
    	t.string :book_name
    	t.string :category
    	t.string :author
    	t.integer :isbn , limit: 8
    	t.integer :price
    	t.integer :status
      t.timestamps
    end
  end
end
