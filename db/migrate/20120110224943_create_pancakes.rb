class CreatePancakes < ActiveRecord::Migration
  def change
    create_table :pancakes do |t|
      t.string :polewa
      t.float :ocena
      t.float :cena

      t.timestamps
    end
  end
end
