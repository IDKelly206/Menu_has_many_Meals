class AddCategoriesToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :erecipe_id, :string
    add_column :recipes, :image, :string
  end
end
