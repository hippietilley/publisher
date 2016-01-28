class SyndicatorsController < ApplicationController
  before_action :authorize

  def create
    @post = Post.of(params[:post_type]).find(params[:id])
    twitter_client.update(@post.content)
    redirect_to @post.path
  end

  private

  def twitter_client
    provider = current_user.providers.first
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Setting.of(:syndication_twitter_key).content
      config.consumer_secret     = Setting.of(:syndication_twitter_secret).content
      config.access_token        = provider.token
      config.access_token_secret = provider.secret
    end
  end
end
