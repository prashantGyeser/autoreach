class SetArticleDetailsJob < ActiveJob::Base
  queue_as :default

  rescue_from(ActiveRecord::RecordNotFound) do |exception|
    Rollbar.error(exception)
  end

  def perform(article)
    ArticleDetails.new({article: article}).set_details
  end
end
