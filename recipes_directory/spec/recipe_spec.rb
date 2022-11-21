require 'recipe'
require 'recipe_repository'
require 'pg'
require 'database_connection'

def reset_recipes_table
    seed_sql = File.read('spec/seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test'})
    connection.exec(seed_sql)
end
describe RecipeRepository do 
    before (:each) do
        reset_recipes_table
    end
    it 'tests the all method, returning the name of the record' do
        repo = RecipeRepository.new
        recipes = repo.all
        result = recipes[0].name
        expect(result).to eq 'Cookie'
    end
    it 'tests the all method, returning the rating of the record' do
        repo = RecipeRepository.new
        recipes = repo.all
        result = recipes[0].rating
        expect(result).to eq "2"
    end
    it 'uses find method to find name of second record' do
        repo = RecipeRepository.new
        recipe = repo.find(2)
        result = recipe.name
        expect(result).to eq 'Cake'
    end
    it 'uses find method to find rating of first record' do
        repo = RecipeRepository.new
        recipe = repo.find(1)
        result = recipe.rating
        expect(result).to eq '2'
    end


end


#2

#repo = RecipeRepository.new
#recipe = repo.find(2)

#recipe.id # => 2
#recipe.name # => 'Cake'
#recipe.average_cooking_time # => 30
#recipe.rating # => 4