class SyndicatorsController < ApplicationController
  before_action :authorize

  def create
    @syndicator = Syndicator.for(params[:service])
    if @syndicator.valid?
      @post = Post.of(params[:post_type]).find(params[:id])

      if @post.in_reply_to.present?
        url                   = @post.in_reply_to.split.first
        in_reply_to_status_id = url.split("/").last

        options = { in_reply_to_status_id: in_reply_to_status_id }
      end

      syndication = twitter_client.update(@post.syndication_content, options)
      @post.syndications.create(url: syndication.url, name: params[:service])
      redirect_to @post.path
    else
      redirect_to settings_path, notice: "Provide syndication keys for #{params[:service]} to syndicate."
    end
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
