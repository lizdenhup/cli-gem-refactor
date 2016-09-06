require 'spec_helper'

RSpec.describe WikinewsScraper::Article do 
  # If the fixtures are deleted or VCR generates new cassettes these tests
  # will have to be updated based on current values from:
  # https://en.wikinews.org/wiki/Main_Page as well as one of the articles linked
  # from the day's headlines. 
  context 'Main_Page' do 
    it 'scrapes the main page of Wikinews' do 
      VCR.use_cassette("main_page") do 
        expect(WikinewsScraper::Scraper.new.scrape_articles.first.title).to eq("Candidates suspend campaigns as Hong Kong legislative election approaches")
      end 
    end 
  end 
end 