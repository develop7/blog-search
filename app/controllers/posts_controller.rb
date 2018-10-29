class PostsController < ApplicationController
  before_action :find_domain
  def index
    if params[:search]
      @posts = Post.includes(:authors).search(params[:search]) # change this to search after implementing it
    else
      @posts = Post.includes(:authors).where(domain: params[:domain])
    end
  end

  def show
    @post = Post.find_by(domain: params[:domain], slug: params[:slug])
  end

  private

  def find_domain
    domain = params[:domain]
    unless Post.where(domain: domain).count.positive?
      flash[:error] = "Couldn't open blog #{domain}"
      redirect_to('/blog')
    end
  end
end
