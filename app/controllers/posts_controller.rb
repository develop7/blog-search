class PostsController < ApplicationController
  def index
    if params[:search]
      @posts = Post.basic_search(params[:search]) # change this to search after implementing it
    else
      @posts = Post.includes(:authors).where(domain: params[:domain])
    end
  end

  def show
    @post = Post.find_by(domain: params[:domain], slug: params[:slug])
  end
end
