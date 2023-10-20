require_relative 'view'
#  TODO: Define your Controller Class here, to orchestrate the other classes
class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_list
  end

  def add
    # 1. ask for the name to the user
    recipe_name = @view.ask_for_name
    # 2. ask for the description to the user
    recipe_description = @view.ask_for_description
    # 3. Instantiate the new Recipe
    new_recipe = Recipe.new(recipe_name, recipe_description)
    # 4. Tell the cookbook to create it
    @cookbook.create(new_recipe)
  end

  def remove
    # 1. show all the recipes
    display_list
    # 2. choose the one from the list (Ask for index)
    index = @view.ask_for_index
    # 3. Tell repository to remove recipe from cookbook
    @cookbook.destroy(index)
  end

  private

  def display_list
    # 1. Get all the recipes from the cookbook
    all_recipes = @cookbook.all
    # 2. Tell the view to display all the tasks
    @view.display_list(all_recipes)
  end
end
