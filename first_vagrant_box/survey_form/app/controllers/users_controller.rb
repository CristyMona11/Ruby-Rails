class UsersController < ApplicationController
  def index
    session[:views] ||=0
  end

  def create
    session[:views] = session[:views] + 1
    session[:show] = params[:user]
    flash[:success] = "You successfully submitted this form #{session[:views]} times!"
    redirect_to 'users/show'
  end

  def show
    @show = session[:show]
  end
end
