require "csv"
require_relative 'recipe'
# TODO: Implement the Cookbook class that will be our repository
class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      # 1. PUSH THE HEADERS
      csv << ['name', 'description']
      # 2. push all recipes
      # 2.1 iterate over the recipes array
      @recipes.each do |recipe|
        # 2.2 push the recipes to the csv (convert to an array of strings)
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row) do |row|
      # Here, row is an array of columns
      # p row #=> ["Crumpets", "Crumpets description"]
      # 1. recreate the instances of recipes using the data from the CSV
      new_recipe = Recipe.new(row["name"], row["description"])
      # # p row
      # # p new_recipe
      # # 2. populate our recipes array
      @recipes << new_recipe
    end
  end
end
