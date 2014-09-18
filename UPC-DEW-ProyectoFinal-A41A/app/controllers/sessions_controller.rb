class SessionsController < ApplicationController
  def create
    #raise request.env["omniauth.auth"].to_yaml
    auth = request.env['omniauth.auth']

    if (auth)
      authenticate = Authentication.find_by_provider_and_uid(auth['provider'],auth['uid'])


      if current_user
        user = current_user
      elsif (authenticate)
        user = User.find(authenticate.user_id)
      else
        user = User.new_authentication(auth)
        Authentication.create_with_omniauth(auth, user)
      end

      session[:user_id] = user.id
      redirect_to setting_url

    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
