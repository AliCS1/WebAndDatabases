require_relative 'lib/recipe_repository'
require_relative 'lib/database_connection'
require 'pg'

DatabaseConnection.connect('recipes_directory_test')

repo = RecipeRepository.new
result = repo.all
result.each { |record| 

    p record.id + " - " + record.name + " - " + record.average_cooking_time + " - " + record.rating

}