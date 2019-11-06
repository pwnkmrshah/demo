class RemoveForeignKeyFromIssueBook < ActiveRecord::Migration[5.0]
  def self.down
	  change_table :issue_books do |t| 
       t.belongs_to :books 
    end
 	end
end
