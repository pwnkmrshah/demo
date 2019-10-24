class BooksController < ApplicationController

	def new
		@book = Book.new
	end
  
  def book_list
    @book =Book.all
  end

  def create
  byebug
  @book = Book.new(book_params)
  @book.status = "available"
    if @book.save
      flash[:notice] = "#{@book.book_name} saved"
      redirect_to book_list_path(@book)
    else
      render 'new'
    end
  end

  private
  def book_params
    params.require(:book).permit(:book_name, :category, :author, :isbn, :price, :status)
  end
end