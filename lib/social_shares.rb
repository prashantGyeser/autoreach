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
    shared_count_facebook_shares = shared_count_facebook
    if shared_count_facebook_shares.nil?
      return {facebook: get_shares_through_facebook, twitter: nil, google: nil, linkedin: nil}
    else
      return {facebook: shared_count_facebook_shares, twitter: nil, google: nil, linkedin: nil}
    end

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

  def get_shares_through_facebook
    url_for_facebook = 'http://api.facebook.com/restserver.php?method=links.getStats&urls=' + url
    response = HTTParty.get(url_for_facebook)
    shares_from_facebook_xml(response.body)
  end

  def shares_from_facebook_xml(facebook_share_xml)
    facebook_share_hash = Hash.from_xml(facebook_share_xml)
    facebook_share_hash["links_getStats_response"]["link_stat"]["share_count"].to_i
  end

end