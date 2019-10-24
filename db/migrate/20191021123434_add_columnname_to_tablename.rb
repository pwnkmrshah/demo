class AddColumnnameToTablename < ActiveRecord::Migration[5.0]
 def change
    change_column :issue_books, :status, :integer,  default: nil
  end
end
