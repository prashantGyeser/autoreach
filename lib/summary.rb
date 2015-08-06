class Summary

  def url(url)
    response = Unirest::post "https://textanalysis-text-summarization.p.mashape.com/text-summarizer",
                             headers: {
                                 "X-Mashape-Authorization" => "#{ENV['MASHAPE_API_KEY']}",
                                 "Content-Type" => "application/json"
                             },
                             parameters: "{\"url\":\"#{URI.encode(url)}\",\"text\":\"\",\"sentnum\":8}"

    return response.body["sentences"].join(" ")
  end
end