class HomeController < ApplicationController
	
	def show
		@books = Book.all.order('id asc')
	end
	
end
