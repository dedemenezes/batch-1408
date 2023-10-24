require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv
  end

  def find_by_username(username)
    @employees.find do |employee|
      # WE NEED A CONDITION
      employee.username == username
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # p row
      # 1. convert the values to the right data type
      row[:id] = row[:id].to_i
      # p row

      # 2. Create the new instance
      employee = Employee.new(row)
      # p employee
      # 3. Populate the employees array
      @employees << employee
    end
    p @employees
  end
end
