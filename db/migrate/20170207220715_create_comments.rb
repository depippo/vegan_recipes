class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :content
      t.belongs_to :recipe
    end
  end
end
