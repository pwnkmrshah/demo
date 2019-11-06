class BooksController < ApplicationController

	def index
    @books = Book.all.order('id asc')
  end

  def new
		@book = Book.new
	end
  
  def create
    @book = Book.new(book_params)
    @book.status = "available"
    if @book.save
      flash[:notice] = "#{@book.book_name} saved"
      redirect_to books_path(@book)
    else
      render 'new'
    end
  end

  def show
    @issue_books = IssueBook.all
    @book = Book.find_by(id: params["id"])
  end

  def edit
    @book = Book.find_by(id: params["id"])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render "edit"
    end
  end

  def destroy
    byebug
    @book = Book.find(params[:id])
    if @book.destroy
       redirect_to books_path, notice: 'Book was successfully destroyed.' 
     else
      render "index"
     end
    end

  private
  def book_params
    params.require(:book).permit(:book_name, :category, :author, :isbn, :price, :status, :image)
  end

end