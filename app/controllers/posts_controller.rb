class PostsController < ApplicationController

  layout 'application'

  before_action :get_categories, :get_recents
  before_action  :set_meta, :set_page_title, only: [:index, :search, :categorize]
  

  def index
    @posts = Post.order('id desc').paginate(page: params[:page], per_page: 8)
    redirect_to root_path and return if @posts.empty?
    respond_to do |format|
      format.html
      # format.json { render json: @posts.as_json }
    end
  end

  
  def show
    @post = Post.get params[:title]
    if @post.present?
      set_meta @post
      set_page_title @post.title
    else
      redirect_to root_path
    end
  end


  def search
    if params[:keyword].strip.present? 
      render json: Post.select(:title).search(params[:keyword])
    else
      render json: Hash.new
    end
  end


  def categorize
    @members = Post.categorize(params[:category]).paginate(page: params[:page], per_page: 8)
    redirect_to root_path and return if @members.empty?
  end

end
