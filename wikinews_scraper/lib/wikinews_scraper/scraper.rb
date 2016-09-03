class WikinewsScraper::Scraper 

  def scrape_articles
    front_page = Nokogiri::HTML(open("https://wikinews.org"))
    story_item = front_page.css('.l_box')
      story_item.collect do |item|
        title = item.css('.l_title a').text
        link = 'https://en.wikinews.org' + item.css('.l_title a').first.attributes['href'].value
        summary = item.css('.l_summary').first.children.text
        Article.new.tap { |a| a.title = title; a.link = link; a.summary = summary}
      end 
  end 

  def make_article(url)
    article_doc = Nokogiri::HTML(open(url))
    date = article_doc.css('p .published').text 
    text = article_doc.css('p').children.text   
  end 

end 


