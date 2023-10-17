require 'open-uri'
require 'nokogiri'
# SCRAPE TOP 5 movies URL's

def fetch_movie_urls
  # get the generic url
  url = "https://www.imdb.com/chart/top/"
  # open on the uri and you read
  response = URI.open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  # parse using nokogiri
  html_doc = Nokogiri::HTML.parse(response)
  # p html_doc
  # find the right information to scrape
  movies_array = html_doc.search('.ipc-title.ipc-title--base.ipc-title--title.ipc-title-link-no-icon.ipc-title--on-textPrimary.sc-c7e5f54-9.irGIRq.cli-title a')
  urls_array = []
  movies_array.first(5).each do |element|
    full_url = element.attribute('href').value
    movie_url = full_url.split('?')[0]
    urls_array << "https://www.imdb.com#{movie_url}"
  end
  return urls_array
end


def scrape_movie(url)
  # open on the uri and you read
  response = URI.open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0", "Accept-Language" => "en-US").read
  # parse using nokogiri
  html_doc = Nokogiri::HTML.parse(response)
  cast_array = []
  html_doc.search('.ipc-metadata-list__item:contains("Stars") .ipc-inline-list__item a').each do |element|
    cast_array << element.text
  end

  director_array = []
  html_doc.search('.ipc-metadata-list__item:contains("Director") .ipc-inline-list__item a').each do |element|
    director_array << element.text
  end

  storyline = html_doc.search('.sc-466bb6c-3.llCpwq').first.text

  title = html_doc.search('h1').first.text

  year = html_doc.search('.sc-dffc6c81-0.iwmAVw .ipc-inline-list__item').first.text.to_i
  {
    cast: cast_array.uniq,
    director: director_array.uniq[0],
    storyline: storyline,
    title: title,
    year: year
  }
end

# # urls = fetch_movie_urls
url = "https://www.imdb.com/title/tt0111161"
scrape_movie(url)
