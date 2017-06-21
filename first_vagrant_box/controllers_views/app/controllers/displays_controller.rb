class DisplaysController < ApplicationController
  def index
    render text: 'What do you want me to say?'
  end
  def hello
    render text: 'Hello Coding Crustina'
  end
  def say
    unless params[:name]
      render text: "Saying Hello!"
    else
      if params[:name] == "michael"
        redirect_to "/say/hello/joe"
      else
        render text: "Saying Hello #{params[:name]}!"
      end
    end
  end
  def times
    session[:count] ||= 0
    render text: "You visited this url #{session[:count]+=1} times."
  end
  def restart
    session[:count] = nil
    render text: "Destroyed the session!"
  end
end
