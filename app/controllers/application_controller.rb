class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to home_path
    end
  end

  def current_user
    return @current_user if @current_user

    user_id = session[:user_id]
    if user_id
      @current_user = User.find(user_id)
    end
  end
end
