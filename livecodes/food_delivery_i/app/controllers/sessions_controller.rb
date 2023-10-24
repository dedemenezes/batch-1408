require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @session_view = SessionView.new
  end


  def login
    # 1. ask for the username
    username = @session_view.ask_for('username')
    # 2. ask for the password
    password = @session_view.ask_for('password')
    # 3.1 retrieve the employee by the username
    employee = @employee_repository.find_by_username(username)
    # 3.2 check if we found an employee AND if the password is the same as employee.password
    if employee && employee.password == password
        # login the user and print a nice welcome message
        @session_view.welcome(employee)
        employee
    else
      # ask for passsword and username again
      # RECURSION!
      login
    end
  end
end
