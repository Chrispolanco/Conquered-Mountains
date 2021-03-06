class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new 
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user && @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user) 
        else 
            render :new
        end
    end 

    def update 
        if @user && @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit 
        end 
    end 

    def destroy
        User.find(params[:id]).destroy 
        flash[:notice] = "User Deleted" 
        redirect_to login_path
    end 

    private 

        def user_params
            params.require(:user).permit(:username, :password, :email, :name)
        end 

        def set_user
            @user = User.find(params[:id])
        end 
    
end 
