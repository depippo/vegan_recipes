class Rating < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  def average
  @recipe.ratings.count
  end

end