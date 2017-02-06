class UserSerializer < ActiveModel::Serializer
  def self.serialize(user)
    user_recipes = []
    user.recipes.each do |recipe|
      user_recipes << recipe.name
    end
    serialized_user = '{'
    serialized_user += '"id": ' + user.id.to_s + ', '
    user_recipes.join(',')
    serialized_user += '"recipes": ' + user_recipes.to_s + ','
    serialized_user += '"email": "' + user.email + '"'
    serialized_user += '}'
  end
end
