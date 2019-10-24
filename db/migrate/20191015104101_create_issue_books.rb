class CreateIssueBooks < ActiveRecord::Migration[5.0]

	def change
  create_table :issue_books do |t|
    t.integer :book_id 
    t.string :email
  	t.date :issue_date
		t.date :return_date
		t.date :submission_date
  
    t.timestamps
	  end
	end
	  def self.down
    drop_table issue_books
  end
end