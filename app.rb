require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'
require_relative 'lib/recipe'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipe_directory')

recipe_repo = RecipeRepository.new

recipe_repo.all.each do |recipe|
  puts "#{recipe.id} - #{recipe.name} - #{recipe.avg_cooking_time} - #{recipe.rating}"
  # p recipe
end