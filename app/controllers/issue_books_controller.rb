class IssueBooksController < ApplicationController
  
  def new
   @issue_book = IssueBook.new
    @book = Book.find_by_id(params["id"])
  end   

  def issue
    @issue_book = IssueBook.new
    @issue_book = IssueBook.new(issue_book_params)
    @issue_book.issue_date = DateTime.current.strftime("%d-%m-%Y")
    @issue_book.submission_date = 30.days.from_now
    @issue_book.status = "issued"
    if @issue_book.save
      flash[:notice] = " #{@issue_book.book_id} issued to #{@issue_book.email} "
      redirect_to manage_book_path

    else
      flash[:alert] = "Not issued"
      redirect_to root_path
    end
  end

  def manage_book
    @issue_book = IssueBook.all
  end
  
  def submit_issued_book
    @issue_book = IssueBook.new
    @book = Book.find_by(id: params["id"])
  end

  def submit
    # byebug
    @issue_book = IssueBook.new
    @issue_book = IssueBook.new(submit_book_params)
    @issue_book.issue_date = DateTime.current
    @issue_book.submission_date = 30.days.from_now
    @issue_book.status = "available"
    if @issue_book.save
      flash[:notice] = " #{@issue_book.book_id} is submitted by #{@issue_book.email} "
      redirect_to manage_book_path
    else
      flash[:alert] = "Not submit"
      redirect_to root_path
    end
  end    

  def re_issue
    @issue_book =IssueBook.new
    @issue_book =IssueBook.all
  end
  private

  def issue_book_params
    params.require(:issue_book).permit(:book_id, :email, :issue_date, :return_date, :submission_date, :status)
  end

  def submit_book_params
    params.require(:issue_book).permit(:book_id, :email, :issue_date, :return_date, :submission_date, :status)
  end
end
