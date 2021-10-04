class PostsController < ApplicationController
    def new 
        @post = Post.new
    end 

    def create 
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save 
            flash[:success] = "Sucessfully Saved Post!"
            redirect_to user_path(current_user)
        else  
            render 'new'
        end 
    end 

    def show
        set_post
    end 

    def set_post
        @post = Post.find_by(id: params[:id])
    end 

    def post_params 
        params.require(:post).permit(:title, :content, :service_id)
    end 
end
