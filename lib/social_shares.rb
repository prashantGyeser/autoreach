class SocialShares
  attr_accessor :url, :shared_count_api

  def initialize(args)
    @url = args[:url]
    @shared_count_api = SharedCountApi::Client.new(url)
  end

  def all
    get_shares
  end

  private
  # Todo: Update this so that it falls back to donreach
  def get_shares
    return {facebook: shared_count_facebook, twitter: nil, google: nil, linkedin: nil}
  end

  def donreach_shares
    response = HTTParty.get(donreach_url)
    social_shares = JSON.parse(response.body,:symbolize_names => true)
    return social_shares[:shares]
  end

  def donreach_url
    URI.encode("https://count.donreach.com/?url=" + url)
  end

  def shared_count_facebook
    shared_count_api.facebook_share_count
  end


end