class WikinewsScraper::Scraper 

  def scrape_articles
    front_page = Nokogiri::HTML(open("https://en.wikinews.org/wiki/Main_Page"))
    story_item = front_page.css('.l_box')
       story_array = story_item.collect do |item|
        title = item.css('.l_title a').text
        link = 'https://en.wikinews.org' + item.css('.l_title a').first.attributes['href'].value
        summary = item.css('.l_summary').first.children.text
        WikinewsScraper::Article.new.tap { |a| a.title = title; a.link = link; a.summary = summary}
      end 
  end 

  def expand_article(input)
    article = WikinewsScraper::Article.find(input)
    article_doc = Nokogiri::HTML(open(article.link))
    article[:text] = article_doc.css('p').children.text
  end 

end 

