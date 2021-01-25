class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, only: [:new, :create]

  def create
    email = params[:email]
    password = params[:password]
    last_name = params[:last_name]
    first_name = params[:first_name]

    user = User.new(email: email, first_name: first_name, last_name: last_name, password: password)

    if user.save
      redirect_to home_path
    else
      flash[:title] = 'Just a small problem'
      flash[:error] = user.errors.full_messages.join(', ')

      redirect_back fallback_location: new_user_path
    end
  end

  def new
    render 'create'
  end
end
