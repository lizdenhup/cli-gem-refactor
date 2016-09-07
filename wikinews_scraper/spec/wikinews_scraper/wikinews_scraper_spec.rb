require 'spec_helper'

RSpec.describe WikinewsScraper::Article do 
  # If the fixtures are deleted or VCR generates new cassettes these tests
  # will have to be updated based on current values from:
  # https://en.wikinews.org/wiki/Main_Page as well as one of the articles linked
  # from the day's headlines. 
  describe '#scrape_articles' do 
    context 'Main_Page' do 
      it 'scrapes the main page of Wikinews' do 
        VCR.use_cassette("main_page") do 
          expect(WikinewsScraper::Scraper.new.scrape_articles.first.title).to eq("Candidates suspend campaigns as Hong Kong legislative election approaches")
        end 
      end 
    end 
  end 


#####TODO for Sept 7, 2016: fix this test & fine-tune the @make_article method to ensure proper assignment of title, summary is happening
  describe "#make_article" do 
    context 'article' do 
      it 'scrapes an individual article from Wikinews' do 
        VCR.use_cassette("candidates_suspend_campaigns_Hong_Kong") do 
          expect(WikinewsScraper::Scraper.new.make_article('https://en.wikinews.org/wiki/Candidates_suspend_campaigns_as_Hong_Kong_legislative_election_approaches')).to start_with("
            Saturday, September 3, 2016 As the Hong Kong legislative election approaches, six candidates considered")
        end
      end 
    end 
  end 

end 