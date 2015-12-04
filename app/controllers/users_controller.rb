class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :redirect_logged_in_user, only: [:new, :create]
  
  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      remember @user
      flash[:success] = "Welcome to KnowledgeStream"
      redirect_to user_profile_path(@user)
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
      redirect_to user_profile_path(@user), notice: 'User was successfully updated.'
    else
      render 'edit'
    end

  end

  def destroy
    log_out
    @user.delete
    redirect_to root_path, notice: 'your account has been deleted'
  end
    

  def secure_params
    secure_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  private :secure_params

  def post_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
  private :post_params

  def set_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user
  end
  private :set_user

end
