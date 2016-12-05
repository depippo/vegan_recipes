class IngredientSerializer < ActiveModel::Serializer
  attributes :id
  has_many :nutrients
end
