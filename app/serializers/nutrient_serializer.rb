class NutrientSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :ingredients, serializer: NutrientSerializer
end
