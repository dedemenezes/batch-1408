require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"

# PARSING
serialized_beatles = File.read(filepath)
# p serialized_beatles
beatles = JSON.parse(serialized_beatles)
p beatles["beatles"][1]["first_name"]

# STORING
beatles = { beatles: [
  {
    first_name: "John",
    last_name: "Lennon",
    instrument: "Guitar"
  },
  {
    first_name: "Paul",
    last_name: "McCartney",
    instrument: "Bass Guitar"
  }
] }

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beatles))
end
