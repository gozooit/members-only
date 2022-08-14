class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(user_id: current_user)
    if @post.save
      redirect_to new_post_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
