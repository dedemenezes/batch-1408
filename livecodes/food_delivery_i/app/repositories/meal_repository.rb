require 'csv'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @meals
  end

  def find(meal_id)
    @meals.find { |meal| meal.id == meal_id }
  end

  def create(new_meal)
    new_meal.id = @next_id
    @next_id += 1
    @meals << new_meal
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      meal = Meal.new(row)
      @meals << meal
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end
end
