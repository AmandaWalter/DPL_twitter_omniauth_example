class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
    respond_with(@post)
  end

  def edit
  end

  def create
    @user = User.find(params[:post][:user_id])
    @post = @user.posts.build(post_params)
    @post.save
    respond_with(@user)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
