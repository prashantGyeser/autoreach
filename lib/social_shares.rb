class SocialShares
  attr_accessor :url

  def initialize(args)
    @url = args[:url]
  end

  def all
    get_shares
  end

  private
  def get_shares
    response = HTTParty.get(donreach_url)
    social_shares = JSON.parse(response.body,:symbolize_names => true)
    return social_shares[:shares]
  end

  def donreach_url
    URI.encode("https://count.donreach.com/?url=" + url)
  end


end