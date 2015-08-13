class FacebookPage
  attr_accessor :facebook_user_token, :user_graph

  def initialize(facebook_user_token)
    @facebook_user_token = facebook_user_token
    @user_graph = Koala::Facebook::API.new(facebook_user_token)
  end

  def user_pages
    test = user_graph.get_connections('me', 'accounts')
    puts "hello"
    puts test.first.inspect

  end

  private
  def page_token(page)
    page['access_token']
  end

end