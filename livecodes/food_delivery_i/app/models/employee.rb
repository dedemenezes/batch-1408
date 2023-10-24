class Employee
  attr_reader :username, :password
  # STATE/ATTRIBUTES
  # id       => intenger
  # username => String
  # password => String
  # role     => String => 'manager' || 'rider'
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role     = attributes[:role]
  end

  def manager?
    @role == 'manager'
  end
end
