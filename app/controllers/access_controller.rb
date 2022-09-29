class AccessController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout, :create]


  def menu
    if session[:user_id]
      @adminUser = AdminUser.find(session[:user_id])
    end
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in."
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(access_login_path)
  end

  # test************
  def create
    @adminUser =
      AdminUser.find_or_create_by!(uid: auth['uid']) do |u|
        # u.username = auth['info']['nickname']
        # u.password_digest = auth['uid']
        u.name = auth['info']['name']
        u.email = auth['info']['email']
      end
      @adminUser.username = @adminUser.email
    session[:user_id] = @adminUser.id

    render 'menu'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
