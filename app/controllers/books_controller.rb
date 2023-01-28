class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def new
    @book=Book.new
  end

   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    flash[:notice] = 'created book successfully.'
    
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
   end
    
  def index
    @user = current_user
        @books = Book.all
        @book = Book.new
    
  end

  def show
    @books=Book.find(params[:id])
    
    @book = Book.new
    @user=User.find(@books.user_id)
     
       
    
  end

  def edit
    @book=Book.find(params[:id])
  end
  
   def destroy
    book=Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
    end
   end
  
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = 'updated book successfully.'

    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :edit
    end
    
  end
  private

  def book_params
    params.require(:book).permit(:title,  :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
  
end
