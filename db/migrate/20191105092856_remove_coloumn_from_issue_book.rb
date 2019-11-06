class RemoveColoumnFromIssueBook < ActiveRecord::Migration[5.0]
  def change
  	 remove_column :issue_books, :books_id, :integer
  end
end
