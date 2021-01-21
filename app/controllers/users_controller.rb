class UsersController < ApplicationController
  def login
    email = params[:email]
    password = params[:password]

    user_exists = User.where(email: email, password: password).count
    render plain: user_exists.zero? ? 'false' : 'true'
  end

  def index
    render plain: User.all.map {|user| user.pretty_string}.join("\n")
  end

  def create
    email = params[:email]
    password = params[:password]
    last_name = params[:last_name]
    first_name = params[:first_name]

    User.create!(email: email, first_name: first_name, last_name: last_name, password: password)
    redirect_to home_path
  end

  def show
    render plain: User.find(params[:id]).pretty_string
  end

  def new
    render 'create'
  end
end
