class UsersController < ApplicationController
    attr_accessor :username, :email, :password

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            log_in @user
            flash[:success] = "Welcome!"
            redirect_to @user
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Profile Updated"
            redirect_to @user
        else
            render 'edit'            
        end           
    end

    def destroy
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end

end
