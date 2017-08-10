class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :validate_search_key, only: [:search]
  # GET /posts
  # GET /posts.json
  def index
    if params[:category_id].blank?
      @posts = Post.all.order("updated_at DESC").paginate(:page => params[:page], :per_page => 20)
    else
      @posts = Post.where(category_id: params[:category_id]).order("updated_at DESC").paginate(:page => params[:page], :per_page => 20)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
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
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :category_id)
    end
end
