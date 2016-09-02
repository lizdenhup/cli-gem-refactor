class WikinewsScraper::CLI

  def initialize
    welcome 
  end

  def welcome
    puts "Welcome to WikinewsScraper"
    puts "Would you like to learn about today's news? [Y/n]"
    input = gets.strip.upcase
    if input == "Y"
# PUT SCRAPE METHOD HERE
    else 
      puts "Okay, maybe later."
    end 
  end







end 