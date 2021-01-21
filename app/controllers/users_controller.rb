class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in, only: [:new, :create]

  def create
    email = params[:email]
    password = params[:password]
    last_name = params[:last_name]
    first_name = params[:first_name]

    User.create!(email: email, first_name: first_name, last_name: last_name, password: password)
    redirect_to home_path
  end

  def new
    render 'create'
  end
end
