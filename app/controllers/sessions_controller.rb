class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render 'new'
  end

  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)

    if user != nil && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to todos_path
    else
      flash[:title] = 'Login failed'
      flash[:error] = 'The account details you entered were incorrect'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil

    redirect_to home_path
  end
end
