class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
       flash[:errors] = @user.errors.full_messages
       redirect_to '/users'
    end
  end


  def login
    @user = User.find_by(email: user_params[:email]).try(:authenticate,user_params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "incorrect login, try again"
      puts "this is the error line" + @user.errors.full_messages
      redirect_to '/users'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password, :password_confirmation)
    end
end
