class Book < ApplicationRecord

	enum status: [:issued, :available]

	validates :book_name, :presence => true
	validates :category, :presence => true
	validates :author, :presence => true, format: {with: /[a-zA-Z]/}
	validates :isbn, :presence => true, numericality: { only_integer: true, message: "Integer only" } 
	validates_uniqueness_of :isbn
	validates :price, :presence => true, numericality: { only_integer: true, message: "Integer only" }

  	mount_uploader :image, ImageUploader

  	

end
