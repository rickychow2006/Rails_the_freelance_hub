class SessionsController < ApplicationController
    
    def show 
        if logged_in?
          redirect to user_path(@user)
        else 
          redirect_to to "/"
        end 
      end 

    def destroy 
        session.clear
        redirect_to '/'
    end 

    def create 
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.user_id
            redirect_to user_path(user)
        else 
            redirect_to "/"
        end 
    end 
end
