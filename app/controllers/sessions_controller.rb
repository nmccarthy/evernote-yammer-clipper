class SessionsController < ApplicationController

  skip_before_filter :authenticate, :only => [ :create, :destroy ]

  def create
    auth = request.env["omniauth.auth"]
    # raise auth.to_yaml

    if User.find_by_yammer_uid(auth["uid"]) == nil
      user = User.create_with_omniauth(auth)
    else
      user = User.find_and_update(auth)
    end

    session[:user_id] = user.id
    redirect_to "/", :notice => "Signed in!"
  end

  def connect_evernote
    auth = request.env["omniauth.auth"]
    # raise auth.to_yaml

    current_user.update_evernote_data(auth)

    # if User.find_by_yammer_uid(auth["uid"]) == nil
    #   user = User.create_with_omniauth(auth)
    # else
    #   user = User.find_and_update(auth)
    # end

    # session[:user_id] = user.id
    redirect_to "/", :notice => "Connected!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/", :notice => "Signed out!"
  end
end
