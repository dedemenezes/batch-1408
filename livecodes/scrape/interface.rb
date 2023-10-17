require 'yaml'
require_relative 'scraper.rb'
urls = fetch_movie_urls
movies = urls.map do |url|
  scrape_movie(url)
end

File.open('movies.yml', 'w') do |f|
  f.write(movies.to_yaml)
end
