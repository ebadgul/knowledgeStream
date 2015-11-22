class UsersController < ApplicationController
    before_action :authenticate_user, except: [:new, :create]
    before_action :set_post, only: [:edit, :update, :destroy]

    def show
        @user = User.find(params[:user_id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(secure_params)
        if @user.save
            remember @user
            flash[:success] = "Welcome to the Twitter App"
            redirect_to @user 
            # Handle a successful save.
        else
            render 'new' 
            # Handle an unsuccessful save.     
        end
    end

    def edit
    end

    def update
        if @user.update(post_params)
            redirect_to @user, notice: 'User was successfully updated.'
        else
            render :edit
        end

    end

    def secure_params
        secure_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    private :secure_params

    def post_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end
    private :post_params

    def set_post
        @user = User.find(params[:id])
        redirect_to root_path unless @user
    end
    private :set_post

end
