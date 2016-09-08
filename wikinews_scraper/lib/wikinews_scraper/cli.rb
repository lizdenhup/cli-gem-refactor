class WikinewsScraper::CLI

  def welcome
    puts "Welcome to WikinewsScraper"
    puts "Would you like to learn about today's news? [Y/n]"
    learn_more
  end

  def learn_more
    input = gets.strip.upcase
    if input == "Y"
      list
    elsif input == "N"
      puts "Okay, maybe later."
    else 
      puts "Invalid input - please try again."
      learn_more
    end 
  end 

  def list
    WikinewsScraper::Scraper.scrape_articles
    WikinewsScraper::Article.all.each do |article| 
      puts article.title.upcase + "\n"
      puts article.summary + "\n"
      puts "--------------"
    end 
    more
  end 

  def more
    puts "Would you like to find out more about a story?"
    puts "Enter a number 1-5 to find out more about a particular story."
    input = gets.strip
      if input.to_i.between?(1, 5)
        WikinewsScraper::Scraper.expand_article(input)
        puts WikinewsScraper::Article.find(input).title + "\n"
        puts "----"        
        puts WikinewsScraper::Article.find(input).text + "\n"
        puts "Would you like to learn about more of today's news? [Y/n]"
        learn_more
      else
        puts "Please try again, invalid input."
        more 
      end 
  end 
  
end 