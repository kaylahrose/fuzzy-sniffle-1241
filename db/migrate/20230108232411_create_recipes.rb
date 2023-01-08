class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.references :ingredient, foreign_key: true
      t.references :dish, foreign_key: true
    end
  end
end
