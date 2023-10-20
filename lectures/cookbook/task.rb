class Task
  attr_reader :description
  # description => String
  # done => True/False
  def initialize(desc)
    @description = desc
    @done = false
  end

  def done?
    @done
  end

  def done!
    @done = true
  end
end
