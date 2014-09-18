class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :email_twitter
  helper_method :sum

  private
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def email_twitter
    "twitter@twitter.com"
  end

  def sum(a,b)
    a + b
  end

end
