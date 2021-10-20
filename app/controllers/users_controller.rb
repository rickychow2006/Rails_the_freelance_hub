class UsersController < ApplicationController
    def index 
        render :show
    end 
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            flash[:success] = "You have successfuly created an account! Welcome to the The Freelance Hub community!"
            redirect_to @user 
        else 
            flash[:error] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
            render :new
        end 
    end 

    def show 
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect to '/' if !@user 
    end 

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end 

    def search 
        if params[:search] == ""
            render "show"
        else 
            x = params[:search].downcase.strip
            @posts_results = Post.where("Lower(title) LIKE?", "%#{x}%")
        end 
    end 
end
