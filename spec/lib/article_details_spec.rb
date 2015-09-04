require 'rails_helper'
require 'article_details'


describe ArticleDetails, :vcr do
  before(:each) do
    @article = Article.create(url: "https://blog.kissmetrics.com/use-kissmetrics-discover-freemium-value/", user_keyword_id: 1)
    @article_content = "Using Kissmetrics to Discover the Value of Your Freemium Offering A Blog About Analytics, Marketing and Testing Webinars Marketing Guides Infographics Kissmetrics Products Pricing Customers About Blog 1-888-767-5477 Sign Up Sign In The Kissmetrics Blog: A Blog about Analytics, Marketing and Testing Infographics Marketing Guides Webinars Kissmetrics Academy Products Pricing Customers About Blog Infographics Marketing Guides Webinars Kissmetrics Academy 1-888-767-5477 Built to optimize marketing. Track, analyze and optimize your digital marketing. Try Kissmetrics Using Kissmetrics to Discover the Value of Your Freemium Offering Ah, the freemium model. It has helped build companies like Dropbox, Spotify, and MailChimp. But can it work for you? Unfortunately, plenty of failed companies used the freemium model, too. There are a few ways to determine the effectiveness of your freemium plan. For instance, you can track all your freemium customers in a spreadsheet to see which ones convert to paying customers. This will require a lot of work. Plus, it’s not automated, the spreadsheet can get pretty full, and it’s tough to get insights out of a big spreadsheet. You can also use Kissmetrics. We have a suite of reports that will take all your data and show you various insights into whether freemium is working for your company. You’ll just need to set up the reports. That’s what this post is about. We’ll go through three of our reports that you can use to see if you should continue with your freemium plan or kill it off in favor of all-paid pricing plans. Let’s begin. Discovering If and When Customers Upgrade from Freemium Obviously, companies cannot succeed if 100% of their customers are on the “free” plan. They need their free customers to grow out of the plan and/or refer others who will sign up for a paid plan. But if you’re not tracking the data, how would you ever know if people upgrade from the free plan to one of your paid plans? Using the Kissmetrics Cohort Report, you can see if and when your freemium customers move up and start paying you. You’ll also be able to see which marketing campaigns and customer segments upgrade the most. In simple terms, a cohort is a group of people who share a similar experience. So people who signed up for a free plan and later upgraded to a paid plan would be in a cohort. The Kissmetrics Cohort Report will show you these people and how many of them upgraded. Here’s how it will look: On the left side, we see the people who signed up for the freemium plan. The property (Social, Organic, Direct, etc.) tells us where the people came from. So, for example, if someone came from Twitter and signed up, they’d be put in the Social group. (The None category is for people who do not fit in any of the properties.) The right side tells us what percentage of the people in each group later went on to upgrade to a paying plan. The darker the shade of blue, the higher the percentage. The higher the percentage, the better. Here are some important takeaways from this data: Some of the stronger channels are Organic, Direct, and Referral. Social acquires the most signups, but doesn’t convert at a higher percentage than the other groups. If this were your data, you’d know that you could put more focus and effort in getting signups from these channels. Direct would be a little difficult (these are people who have no referrer), but generally an increase in brand awareness means more direct visits. Paid has brought 6 free signups, but none of them have converted to paying. We’ll have to see what we’re spending on this channel to know if it’s worth it. If it’s a reasonable cost, we should wait until we get more signups to see if Paid really is a bad channel for conversions. Overall, a solid percentage of people upgrade to paying. To build a successful business, the money we receive from customers will have to exceed the amount it takes to acquire them. Free signups are generally low-cost, so if this were our data, it would look pretty good that we are able to acquire customers profitably. You can also use the Kissmetrics Funnel Report to track the percentage of people who move from the “freemium signup” step to the “billed” step in your sales funnel. You just won’t be able to know when they convert, as you can with a cohort report. (A funnel report can be used for a number of other purposes, including finding where visitors drop off in the path to purchase, finding which A/B test variation led to more signups, etc.) Click here to view a demo of the Cohort Report. Knowing if Freemium Spreads Many free plans have some virality engine built in. Users on the Dropbox free plan, for example, get more space if they refer people to Dropbox. If your free plan has something like this, you can use the same Cohort Report to tell you when people share your product with others. Just set your criteria to people who signed up for freemium and later referred their friends. You can segment people by channel (as we did above) or by when they signed up or by whatever will deliver the best insights for you. As long as you’re tracking it, you can get the data. Finding Out if Freemium Users Are Using Your Product If freemium users aren’t using your product, it may be a sign of one of the following problems: There is no product/market fit. You’re signing up people who aren’t interested in your product. The capabilities of the freemium plan are too limited for any practical use. Your product isn’t any good. In this case, the majority of your paid users won’t be using the product either. We can track usage with a simple login retention cohort, or we can use the Kissmetrics People Search to get a list of people who have signed up for the free trial but have not used the product. We can then email these people and gather feedback. The Kissmetrics People Search allows you to find people based on specific criteria. For example, you can find people who have logged in but not used a feature. Or you can find people who have signed up but not logged in, which is what we’ll be searching for. Here are the criteria: As you can see, we’re looking for people who have signed up for the freemium plan but have not logged in. We want to see all the people who fit these criteria in the last 30 days. We aren’t limited to looking at people who have not logged in. If we’re tracking it, we can view the people who have signed up but not used a feature or the people who have signed up but not upgraded. Let’s click Search and get our data: We’re viewing 10 of the 122 people who fit the criteria. We can export this data to a CSV file and then upload it to an email service provider such as MailChimp. Or we can email each person individually to get feedback. If you’re tracking it, you can also use People Search to discover the users who have been using freemium but have not upgraded to a paying plan. You can email these people to learn more about their use cases, what’s working for them, and even target them for upgrades. As long as you’re tracking it, you can get the data and find the people. Click here to view a demo of People Search. Use Data to Discover if Freemium Is Working for You When you offer a freemium plan, you reduce the barrier to entry for many people. Then, ideally, the freemium users upgrade to a paying plan or refer others who pay. But if none of the freemium users upgrade to a paying plan or refer others, your freemium plan may just be a burden on your business. Analytics tools like Kissmetrics (with its Cohort Report, Funnel Report, and People Search) can help you discover if freemium is working for your business. If you’re using freemium on your product, you may want to sign up for Kissmetrics to see if it’s working for you. You can sign up for a free 14-day trial, or request a personal demo of Kissmetrics. About the Author: Zach Bulygo (Twitter) is a Content Writer for Kissmetrics. Optimize Every Web Interaction Create triggered popups, nudges, and lightboxes to boost conversions. Start 14-Day Trial No comments yet Cancel reply Name * Email * Website Comment Please use your real name and a corresponding social media profile when commenting. Otherwise, your comment may be deleted. ← Previous ArticleNext Article → Tweet Free Email Updates Get the latest content first. Follow Us Article Categories Academy Advertising Analytics Blogging Branding Conversion Copywriting Design E-Commerce Facebook Infographics Launch Strategies Marketing SEO Social Media Testing Twitter Track every single interaction a person has with your business. You won’t just be looking at aggregate data. Go back and look at each person’s interaction history no matter where it happens, web, mobile, social, desktop and even offline. Start your free 14-day trialNo credit card required. © 2015 Kissmetrics, San Francisco Kissmetrics Support Careers Terms of Use Privacy Policy"
  end

  it "should get the content of a blog" do
    ArticleDetails.new({article: @article}).set_details
    expect(@article[:content]).to eq @article_content
  end

  it "should increment the content try after getting the content" do
    ArticleDetails.new({article: @article}).set_details
    expect(@article[:content_tries]).to eq 1
  end

  it "should get the shares of an article" do
    article = Article.create(url: "https://blog.kissmetrics.com/use-kissmetrics-discover-freemium-value/", user_keyword_id: 12, content: @article_content)
    ArticleDetails.new(article: article).set_details
    expect(article[:facebook_shares]).to eq 52
  end

end