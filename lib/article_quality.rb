class ArticleQuality

  def score(args)
    get_score(args)
  end

  def facebook_shares(args)
    get_facebook_share_count(client(args[:url]))
  end

  private
  def get_social_share(url)
    client = client(url)
    client.twitter + client.facebook_share_count + client.google_plus_one
  end

  def get_score(args)
    score_args = {}
    score_args[:social_shares] = get_social_share(args[:url])
    calculate_score(score_args)
  end

  def calculate_score(score_args)
    if score_args[:social_shares] < 20 && score_args[:social_shares] >= 0
      return 2
    elsif score_args[:social_shares] < 500 && score_args[:social_shares] >= 20
      return 4
    elsif score_args[:social_shares] < 1000 && score_args[:social_shares] >= 500
      return 6
    elsif score_args[:social_shares] >= 1000
      return 10
    else
      return 0
    end
  end

  def client(url)
    SharedCountApi::Client.new(url)
  end

  def get_facebook_share_count(client)
    client.facebook_share_count
  end

end