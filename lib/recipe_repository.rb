class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM Recipes;

    # Returns an array of Recipe objects.
    sql = "SELECT * FROM recipes;"
    result_set = DatabaseConnection.exec_params(sql, [])

    recipes = []

    result_set.each { |record|
      recipe = Recipe.new
      recipe.id = record['id'].to_i
      recipe.name = record['name']
      recipe.avg_cooking_time = record['avg_cooking_time'].to_i
      recipe.rating = record['rating'].to_i

      recipes << recipe
    }

    return recipes
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM Recipes WHERE id = $1;

    # Returns a single Recipe object.
    sql = "SELECT * FROM recipes WHERE id = $1"
    result_set = DatabaseConnection.exec_params(sql, [id])

    recipe = Recipe.new
    recipe.id = result_set[0]['id'].to_i
    recipe.name = result_set[0]['name']
    recipe.avg_cooking_time = result_set[0]['avg_cooking_time'].to_i
    recipe.rating = result_set[0]['rating'].to_i

    return recipe
  end
end