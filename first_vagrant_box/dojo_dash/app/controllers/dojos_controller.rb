class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
  end

  def edit
      @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id])
    @dojo.update(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
    puts @dojo
    redirect_to '/'
  end

  def show
    @dojo = Dojo.find(params[:id])
    render 'show'
  end

  def create
    @dojo = Dojo.create(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
    puts Dojo.last
    redirect_to '/'
  end

  def delete
    Dojo.destroy(params[:id])
    redirect_to '/'
  end

  private
    def user_params
      params.require(:)
    end
end
