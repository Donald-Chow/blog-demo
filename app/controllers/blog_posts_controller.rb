class BlogPostsController < ApplicationController
  before_action :set_blog_post, except: [:index, :new, :crate]

  def index
    @blog_posts = BlogPost.all
  end

  def show
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :published_at)
  end

  def set_blog_post
    @blog_post = @blog_post = BlogPost.published.find(params[:id])
  end
end
