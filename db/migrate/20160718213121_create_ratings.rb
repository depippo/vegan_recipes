class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.belongs_to :recipe
      t.belongs_to :user
    end
  end
end
