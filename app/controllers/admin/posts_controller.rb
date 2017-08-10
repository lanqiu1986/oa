class Admin::PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit,:update, :destory]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :validate_search_key, only: [:search]
  before_filter :require_is_admin
  layout 'admin'

  def index
    @posts = Post.all.order("updated_at DESC").paginate(:page => params[:page], :per_page =>20)
  end

  def show
  end

  def new
    @post = Post.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @post = Post.new(post_params)
    @post.category_id = params[:category_id]
    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @post.category_id = params[:category_id]
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end

  def search
    if @query_string.present?
      search_result = Post.ransack(@search_criteria).result(:distinct => true)
      @posts = search_result.paginate(:page => params[:page], :per_page => 20)
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/,"") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    {:title_or_content_cont => query_string}
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end



end
