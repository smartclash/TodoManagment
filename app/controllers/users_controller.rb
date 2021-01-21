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

    user = User.create!(email: email, password: password).pretty_string
    render plain: "A user created with these information: #{user}"
  end

  def show
    render plain: User.find(params[:id]).pretty_string
  end

  def new
    render 'create'
  end
end
