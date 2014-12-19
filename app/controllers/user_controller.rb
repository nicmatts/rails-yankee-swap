class UserController < ApplicationController

  layout "application"

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    # display text and links
  end

  def login
    # display login form
  end

  def attempt_login
    if params[:name].present? && params[:password].present?
      found_user = User.where(:name => params[:name]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:name] = authorized_user.name
      flash[:notice] = "You are now logged in."
      redirect_to(:controller =>"gift", :action => "index")
    else
      flash[:notice] = "Invalid name/password combination."
      redirect_to(:action => "login")
    end
  end

  def logout
    session[:user_id] = nil
    session[:name] = nil
    flash[:notice] = "You are now logged out."
    redirect_to(:action => "login")
  end
end