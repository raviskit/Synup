class TweetsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]

  def create
    params[:user_id] = current_user.id
    @tweet = Tweet.new(text: params[:tweet][:text], user_id: current_user.id)
    if @tweet.save
      redirect_to root_path, notice: 'twitted successfully'
    else
      render 'home/index', errors: 'unable to tweet'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:format])
    if @tweet.destroy
      redirect_to root_path, notice: 'tweet deleted successfully'
    end
  end

  def like
    @tweet = Tweet.find(params[:id])
    @tweet.likes.push(current_user.id)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text, :user_id)
  end

end
