class PostsController < ApplicationController
  before_action :authenticate_account!, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy ]
  # Add side bar
  before_action :can_access?, except: [:show, :latest]
  before_action :correct_account, only: [:edit, :update, :destroy]


  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  def latest
    @posts = Post.active
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_account.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    # @post = Post.new(post_params)
    @post = current_account.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_account
    @post = current_account.posts.find_by(id: params[:id])

    redirect_to posts_path, notice: "Not Authorized" if @post.nil? 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def can_access?
      @show_sidebar = true
      
      unless current_account.admin?
          redirect_to root_url and return
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :url, :summary, :body, :image, :active, :account_id)
    end
end
