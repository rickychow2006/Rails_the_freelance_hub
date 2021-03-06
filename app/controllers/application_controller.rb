class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private 
    def current_user 
        User.find_by(id: session[:user_id])
    end 

    def logged_in?
        !!session[:user_id]
    end 

    def require_login 
        unless logged_in?
            redirect_to root_path
        end 
    end 

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end 

end
