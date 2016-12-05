class NutrientSerializer < ActiveModel::Serializer
  attributes :id
  has_many :ingredients, serializer: NutrientSerializer
end
