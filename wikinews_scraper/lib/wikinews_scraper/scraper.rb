class WikinewsScraper::Scraper

  def self.scrape_front_page(url)
    front_page = Nokogiri::HTML(open(url))

    story_item = front_page.css('.l_box')
    story_item.collect do |item|
      title = item.css('.l_title a').text
      link = 'https://en.wikinews.org' + item.css('.l_title a').first.attributes['href'].value
      summary = item.css('.l_summary').first.children.text

      Story.new.tap { |s| s.title = title; s.link = link; s.summary = summary}

      end 
  end

  def self.scrape_article(url)
    article = Nokogiri::HTML(open(url))
    article_headline = article.css('h1.firstHeading').text 
    article_date = article.css('p .published').text 
    article_text = article.css('p').children.text
    binding.pry
  end 

end 