class UserfavoritesController < ApplicationController
    def create 
        user_fav = current_user.userfavorites.build(post_id: params[:post_id])
        if user_fav.save
            flash[:message] = "Something went wrong when adding to your favorites."
            redirect_to current_user
        else
            flash[:error] = "Something went wrong when adding to your favorites."
            redirect_to current_user 
        end 
    end 

    def destroy
        set_userfavorites
        @userfavorites.destroy
        redirect_to current_user
    end 
    
    private 

    def set_userfavorites
        @userfavorites = Userfavorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    end 
end
