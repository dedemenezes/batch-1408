# name    => String
# age     => Integer
# address => String

# CLASSES are factories. We define what they are (STATE[instance_variables])
# and what they DO (BEHAVIOUR[methods])
class Butler
  # ATTRIBUTES
  # castle  => Castle CLASS => an Instance of Castle in here
  def initialize(castle)
    @castle = castle # an Instance of Castle in here
  end
end
