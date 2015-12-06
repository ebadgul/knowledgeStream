class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  def show
    @comment = Comment.find(params[:id])
    @post = @comment.posts.new
  end

  # GET /posts/new
  def new
    @comment = Comment.new
  # @post.user = current_user
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    # @comment.post = Post.find(post_id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = @comment.user
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to user_profile_path(@user), notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

end
