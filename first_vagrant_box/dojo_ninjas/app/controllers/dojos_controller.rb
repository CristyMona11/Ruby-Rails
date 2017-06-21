class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
    # render json: @dojos
  end

  def new
    @dojo = Dojo.create( name: params[:name], city: params[:city], state: params[:state])
    redirect_to '/dojos/index'
    puts @dojo
    # render :text => "Came to Create"
  end

  def edit
  end
end
