class BooksController < ApplicationController
  def index
    if session[:user_id].nil?
      return redirect_to '/'
    end
    @reviews = Review.all
  end

  def show
  end

  def new
    if session[:user_id].nil?
      return redirect_to '/'
    end
    @authors=Author.all
  end

  def create
    @author = Author.find_by(params[:list_authors])
    if @author
      @book = Book.create(title: params[:title], author: @author)
      @user = User.find(session[:user_id])
      @review = @user.reviews.create(review: params[:review], rating: params[:rating], book:@book)
    else
      @new_author = Author.create(name: params[:author])
      @book = Book.create(title: params[:title], author: @new_author)
      @user = User.find(session[:user_id])
      @review = @user.reviews.create(review: params[:review], rating: params[:rating], book:@book)
    end
    redirect_to '/books'
  end
end
