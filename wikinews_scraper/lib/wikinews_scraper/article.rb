class WikinewsScraper::Article
  attr_accessor :title, :link, :summary, :text
  
  @@all = []

  def initialize(params = {})
    @title = params[:title]
    @link = params[:link]
    @summary = params[:summary]
  end 

  def save
    @@all << self 
  end 

  def self.create(params = {}) 
    self.new(params).save
  end 

  def self.all 
    @@all ||= scrape_articles
  end 

  def self.find(id)
    self.all[id.to_i - 1]
  end 

end 
