class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Your post was saved successfully."
      redirect_to @post
    else
      flash.now[:alert] = "Your post was not saved. Try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Your post was updated successfully."
      redirect_to @post
    else
      flash.now[:alert] = "Your post was not saved. Try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to posts_path
    else
      flash.now[:alert] = "Error. Try again."
      render :show
    end
  end

  private
    def post_params
      params.require(post).permit(title,body)
    end

end
