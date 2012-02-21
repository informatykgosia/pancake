class JoinAllThePancakes < ActiveRecord::Migration

  def change
    create_table :ingredients_pancakes, :id => false do |t|
      t.integer :ingredient_id
      t.integer :pancake_id
    end
  end

end
