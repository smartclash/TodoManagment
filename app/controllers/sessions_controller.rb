class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)
    if user.authenticate(password)
      render plain: 'You have entered the correct password'
    else
      render plain: 'You have entered the incorrect password'
    end
  end
end
