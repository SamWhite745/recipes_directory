require 'recipe'
require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipe_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it "finds all the entries" do
    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq 2

    expect(recipes[0].id).to eq 1
    expect(recipes[0].name).to eq 'Pasta'
    expect(recipes[0].avg_cooking_time).to eq 12
    expect(recipes[0].rating).to eq 5

    expect(recipes[1].id).to eq 2
    expect(recipes[1].name).to eq 'Pizza'
    expect(recipes[1].avg_cooking_time).to eq 2
    expect(recipes[1].rating).to eq 4
  end
  # (your tests will go here).
end