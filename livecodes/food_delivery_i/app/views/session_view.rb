class SessionView
  def ask_for(anything)
    puts "#{anything}?"
    gets.chomp
  end

  def welcome(employee)
    puts "Welcome #{employee.username}"
    #=> Welcome Fabio
  end
end
