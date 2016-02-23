module Syndicator
  class Twitter

    def valid?
      Setting.of(:syndication_twitter_key).try(:content).present? &&
      Setting.of(:syndication_twitter_secret).try(:content).present?
    end
    
  end
end
