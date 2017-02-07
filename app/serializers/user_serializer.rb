class UserSerializer < ActiveModel::Serializer
  def self.serialize(user)
    user_recipes = []
    user.recipes.each do |recipe|
      recipe_hash = Hash.new
      recipe_hash["id"] = recipe.id
      recipe_hash["name"] = recipe.name
      user_recipes << recipe_hash
    end
    recipes_hash = user_recipes.to_json
    serialized_user = '{'
    serialized_user += '"id": ' + user.id.to_s + ', '
    serialized_user += '"recipes": ' + recipes_hash + ','
    serialized_user += '"email": "' + user.email + '"'
    serialized_user += '}'
  end
end
