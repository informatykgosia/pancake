class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :nazwa
      t.string :kategoria

      t.timestamps
    end
  end
end
