# frozen_string_literal: true

require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv if File.exist?(csv_file_path)
  end

  def all_riders
    # RETURN AN ARRAY OF EMPLOYEES THAT ARE RIDERS!
    @employees.select do |employee|
      employee.rider?
    end
  end

  def find(employee_id)
    @employees.find do |employee|
      employee.id == employee_id
    end
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
    # p @employees
  end
end
