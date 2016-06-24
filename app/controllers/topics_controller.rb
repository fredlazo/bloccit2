class TopicsController < ApplicationController
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
    @topic = Topic.new
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]

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
    @topic = Topic.new
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]

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
  
end
