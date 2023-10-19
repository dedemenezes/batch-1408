# create an array with Simba, Nala, Timon & Pumbaa, iterate over it and puts the sound each animal make

require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'
require_relative 'animal'

simba = Lion.new('Simba')
nala = Lion.new('Nala')
timon = Meerkat.new('Timon')
pumbaa = Warthog.new('Pumbaa')

jungle = [simba, nala, timon, pumbaa]
jungle.each do |animal|
  puts animal.talk # Duck Typing!
end

p Animal.phyla
# .new
p pumbaa.eat('scorpion')
p nala.eat('gazelle')
