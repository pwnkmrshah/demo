class IssueBook < ApplicationRecord

	enum status: [:issued, :available]
	
end
