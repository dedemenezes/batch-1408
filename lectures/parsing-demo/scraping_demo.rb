require "open-uri"
require "nokogiri"

# Let's scrape recipes from https://www.bbcgoodfood.com

# VISITING THE URL
html_file = URI.open("https://www.bbcgoodfood.com/search?q=chicken").read

# PARSE THE HTML INTO NOKOGIRI
html_doc = Nokogiri::HTML.parse(html_file)

# SEARCHING FOR THE ELEMENT YOU WNAT TO SCRAPE
html_doc.search(".layout-md-rail__primary .card__section.card__content a").each do |element|
  p element.text
  p element.attribute('href').value
end
