class SessionsController < ApplicationController
    
    def show 
        if logged_in?
          redirect_to user_path(current_user)
        else 
          redirect_to root_path
        end 
      end 

    def destroy 
        session.clear
        redirect_to root_path
      end 

    def create 
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
          redirect_to root_path
          flash[:error] = "Your credentials were invalid.  Please sign up or try again."
        end 
    end 

    def google 
      @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
        user.username = auth["info"]["first_name"]
        user.password = SecureRandom.hex(10)
      end
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/'
      end
    end

    private

    def auth
      request.env['omniauth.auth']
    end 
end
