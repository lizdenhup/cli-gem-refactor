class WikinewsScraper::Article
  attr_accessor :title, :link, :summary, :text
  
  @@all = []

  def initialize(title = nil, link = nil, summary = nil, text = nil)
    @title = title
    @link = link
    @summary = summary 
    @text = text
    @@all << self
  end 

  def self.all 
    @@all ||= scrape_articles
  end 

  def self.find(id)
    self.all[id.to_i - 1]
  end 

end 