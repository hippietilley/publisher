Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  if Setting.of(:syndication_twitter_secret)
    provider :twitter,
      Setting.of(:syndication_twitter_key).content,
      Setting.of(:syndication_twitter_secret).content
  end
end
