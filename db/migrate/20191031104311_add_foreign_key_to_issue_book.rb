class AddForeignKeyToIssueBook < ActiveRecord::Migration[5.0]
  def change
	  change_table :issue_books do |t| 
       t.belongs_to :books 
    end
 	end
end
