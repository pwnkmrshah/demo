class IssueBook < ApplicationRecord

	belongs_to :book
	
	enum status: [:issued, :available]
end
