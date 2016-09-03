class WikinewsScraper::CLI

  def initialize
    welcome 
  end

  def welcome
    puts "Welcome to WikinewsScraper"
    puts "Would you like to learn about today's news? [Y/n]"
    input = gets.strip.upcase
    if input == "Y"
      list
    else 
      puts "Okay, maybe later."
    end 
  end

  def list
    WikinewsScraper::Scraper.new.scrape_articles
    WikinewsScraper::Article.all.each do |article| 
      puts article.title.upcase + "\n"
      puts article.summary + "\n"
      puts "--------------"
      binding.pry 
    end 
    more
  end 

  def more
    puts "Would you like to find out more about a story?"
    puts "Enter a number 1-5 to find out more about a particular story."
    input = gets.strip
      if input.to_i.between?(1, 5)
        puts WikinewsScraper::Article.all[input.to_i - 1].title + "\n"
        url = WikinewsScraper::Article.all[input.to_i - 1].link
        story = WikinewsScraper::Scraper.make_article(url)
      else
        puts "Please try again, invalid input."
        more 
      end 
  end 
  
end 