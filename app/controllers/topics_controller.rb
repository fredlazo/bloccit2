class TopicsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]

  before_action :authorize_user, except: [:index, :show]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic was edited."
      redirect_to @topic
    else
      flash.now[:alert] = "Error. Try again."
      render :edit
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      flash.now[:alert] = "Error. Try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.name} \" was deleted"
      redirect_to action: :index
    else
      flash.now[:alert] = "Error. Try again."
      render :show
    end
  end

private
  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end


end
