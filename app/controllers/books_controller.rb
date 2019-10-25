class BooksController < ApplicationController

	def new
		@book = Book.new
	end
  
  def book_details
    @book =Book.all
    @issue_book = IssueBook.all
  end

  def create
  byebug
  @book = Book.new(book_params)
  @book.status = "available"
    if @book.save
      flash[:notice] = "#{@book.book_name} saved"
      redirect_to book_details_path(@book)
    else
      render 'new'
    end
  end

  private
  def book_params
    params.require(:book).permit(:book_name, :category, :author, :isbn, :price, :status, :image)
  end
end