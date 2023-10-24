class EmployeeView
  def display_employees(employees_array)
    employees_array.each do |employee|
      puts "#{employee.id} - #{employee.username} - #{employee.role}"
    end
  end
end
