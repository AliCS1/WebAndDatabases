require_relative 'recipe'


class RecipeRepository
    def all
        recipes = []
        sql = 'SELECT * FROM foods'
        result = DatabaseConnection.exec_params(sql, [])

        result.each { |record|
            recipe = Recipe.new
            recipe.id = record['id']
            recipe.name = record['name']
            recipe.average_cooking_time = record['average_cooking_time']
            recipe.rating = record['rating']

            recipes << recipe
        }
        return recipes


    end

    def find(id)
        sql = 'SELECT * from foods WHERE id =  $1'
        params = [id]
        result = DatabaseConnection.exec_params(sql,params)
        recipe = Recipe.new
        recipe.id = result[0]['id']
        recipe.name = result[0]['name']
        recipe.average_cooking_time = result[0]['average_cooking_time']
        recipe.rating = result[0]['rating']
        return recipe

    end
end