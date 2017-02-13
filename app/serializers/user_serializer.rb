class UserSerializer < ActiveModel::Serializer
  has_many :recipes
  def self.serialize(user)
    user_recipes = []
    user.recipes.each do |recipe|
      recipe_hash = Hash.new
      recipe_hash["id"] = recipe.id
      recipe_hash["name"] = recipe.name
      user_recipes << recipe_hash
    end
    recipes_hash = user_recipes.to_json
    user_favorites = []
    user.favorites.each do |favorite|
      favorite_hash = Hash.new
      favorite_hash["id"] = favorite.id
      favorite_hash["name"] = favorite.name
      user_favorites << favorite_hash
    end
    favorites_hash = user_favorites.to_json
    serialized_user = '{'
    serialized_user += '"id": ' + user.id.to_s + ', '
    serialized_user += '"recipes": ' + recipes_hash + ','
    serialized_user += '"favorites": ' + favorites_hash + ','
    serialized_user += '"email": "' + user.email + '"'
    serialized_user += '}'
  end
end
