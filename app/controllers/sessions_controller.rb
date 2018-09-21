class SessionsController < ApplicationController

  def new
      @user = User.new
      redirect_to users_path if logged_in?
    end

    #login through social media or signup form
  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end

    def destroy
      session.clear
      redirect_to root_path, flash: {success: "You're logged out!"}
    end

    private

      def auth
        request.env['omniauth.auth']
      end


end
