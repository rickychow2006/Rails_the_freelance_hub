class UserfavoritesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def create 
        user_fav = current_user.userfavorites.build(post_id: params[:format])
        if user_fav.save
            flash[:success] = "Sucessfully saved to your favorites."
            redirect_to post_path(Post.find_by_id(params[:format]))
        else
            flash[:error] = "Something went wrong when adding to your favorites."
            redirect_to current_user 
        end 
    end 

    def index
        render "index"
    end 

    def destroy
        set_userfavorites
        @userfavorites.destroy
        redirect_to post_path(Post.find_by_id(params[:id]))
        flash[:success] = "Sucessfully removed from your favorites."
    end 
    
    private 

    def set_userfavorites
        @userfavorites = Userfavorite.find_by(post_id: params[:id], user_id: current_user.id)
    end 
end
