require_relative 'building'
require_relative 'butler'
class Castle < Building
  attr_reader :butler

  def initialize(name, width, length)
    super(name, width, length)
    @butler = Butler.new(self) #=> an INSTANCE of Butler class
  end
  # only the castle has a moat

  # CLASS METHODS
  # def self.method_name
  # end

  def self.categories
    # `self` will reference the element which called the method
    p self
    ["Medieval", "Norman", "Ancient"]
  end

  attr_accessor :moat
  # def moat=(value)
  #   @moat = value
  # end

  # INSTANCE METHODS
  def has_a_moat?
    @moat != nil
  end

  # CHANGE AN INHERITED METHOD
  def floor_area
    p "self inside instance method: #{self}"
    # `super` will call the SAME METHOD on the ParentClass
    super + 300
  end
end

sultan_palace = Castle.new('The Sultan Palace', 400, 400)

p sultan_palace
p sultan_palace.butler
