class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        render 'index'
    end 
    
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

    def edit
        set_post
        redirect_to_post_path if @post.user != current_user
    end 

    def update 
        set_post 
        redirect_to_post_path if @post.user != current_user
        if @post.update(post_params)
            flash[:success] = "Updated successfully!"
            redirect_to post_path(@post)
        else 
            flash[:error] = "Unsuccessful update. Try again!"
            render :edit
        end 
    end 

    def destroy
        set_post
        if current_user == @post.user
            @post.destroy
            redirect_to user_path(current_user)
        else  
            flash[:alert] = "Sorry, you can only delete your own post"
            redirect_to @post
        end 
    end 
    
    def set_post
        @post = Post.find_by_id(params[:id])
    end 

    def post_params 
        params.require(:post).permit(:title, :content, :service_id)
    end 
end
