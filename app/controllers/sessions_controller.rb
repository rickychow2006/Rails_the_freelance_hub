class SessionsController < ApplicationController
    
    def show 
        if logged_in?
          redirect_to user_path(current_user)
        else 
          render "home"
        end 
      end 

    def destroy 
        session.clear
        render "home"
      end 

    def create 
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
          render "home"
        end 
    end 
end
