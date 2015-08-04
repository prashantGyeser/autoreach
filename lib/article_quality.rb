class ArticleQuality

  def eliminate_least_shared(keyword)
    remove_non_performing_articles(order_by_shares(articles(keyword)))
  end

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

  def articles(keyword)
    # Todo: This will become slow once there are a few 1000 articles.
    Article.where(keyword_id: keyword[:id])
  end

  # This will return an array of array with the first value in the array being the share count.
  # The arrays being ordered by that count
  def order_by_shares(articles)
    articles.order("facebook_shares DESC")
  end

  def remove_non_performing_articles(articles)
    remove_low_shared_articles(articles,number_of_articles_to_remove(articles))
  end

  def number_of_articles_to_remove(articles)
    total_articles = articles.count
    ((20*total_articles)/100).to_i
  end

  def remove_low_shared_articles(articles, number_of_articles_to_remove)
    mark_as_low(articles.last(number_of_articles_to_remove))
  end

  def mark_as_low(low_share_articles)
    low_share_articles.each do |article|
      article.shares_low = true
      article.save
    end
  end

end