class StaticController < ApplicationController
  def home
    require 'rss'
    require 'open-uri'
#    @rss = RSS::Parser.parse open('http://slashdot.org/index.rdf'),false
    wp_url = 'http://feeds.washingtonpost.com/rss/national/energy-environment'
    nyt_url = 'http://www.nytimes.com/services/xml/rss/nyt/EnergyEnvironment.xml'
    url = 'http://www.ruby-lang.org/en/feeds/news.rss'
    open(url) do |rss|
      @feed = RSS::Parser.parse(rss)
    end
    open(nyt_url) do |rss|
      @nyt_feed = RSS::Parser.parse(rss)
    end
    open(wp_url) do |rss|
      @wp_feed = RSS::Parser.parse(rss, false)
    end

  end
end