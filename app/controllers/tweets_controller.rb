class TweetsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new]
 def index
   @tweets = Tweet.all.order(:created_at => :desc)
 end
 	def new
    @tweet = Tweet.new

    @something = "hello world"

  end

  def create
    if @tweet = Tweet.create(body: params[:tweet][:body], user_id: current_user.id )
      redirect_to tweets_path
    else
      render :new
    end
  end

  def show 
    @tweet = Tweet.find(params[:id])
  end
end
