class PusherUpdates

  def send_article_to_frontend(article)
    # Todo: Need to check if the facebook share is above 0. Will have to do that check before calling this function
    channel_name = "private_#{article.user_id}"
    user_keyword = UserKeyword.find(article.user_keyword_id)
    Pusher[channel_name].trigger('new_article', { id: article.id, title: article.title, url: article.url, keyword: user_keyword.keyword })
  end

  def processing_complete(user_keyword)
    channel_name = "private_#{user_keyword.user_id}"
    Pusher[channel_name].trigger('processing_complete', { id: user_keyword.id })
  end

  def processing_in_progress(user_keyword)
    channel_name = "private_#{user_keyword.user_id}"
    Pusher[channel_name].trigger('processing_inprogress', { id: user_keyword.id })
  end

end