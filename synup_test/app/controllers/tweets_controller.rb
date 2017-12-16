class TweetsController < ApplicationController
  def create
    params[:user_id] = current_user.id
    @tweet = Tweet.new(text: params[:tweet][:text], user_id: current_user.id)
    if @tweet.save
      redirect_to root_path, notice: 'twitted successfully'
    else
      render 'home/index', errors: 'unable to tweet'
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text, :user_id)
  end
end
