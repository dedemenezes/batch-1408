# CLASSES are factories. We define what they are (STATE[instance_variables])
# and what they DO (BEHAVIOUR[methods])
class Building
  # STATES/ATTRIBUTES
  # width
  # length
  # name
  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
  end

  attr_reader :name, :length, :width

  # def name
  #   @name
  # end

  # def length
  #   @length
  # end

  def floor_area
    @width * @length
  end
end
