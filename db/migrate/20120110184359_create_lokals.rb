class CreateLokals < ActiveRecord::Migration
  def change
    create_table :lokals do |t|
      t.string :nazwa
      t.string :adres
      t.float :ocena

      t.timestamps
    end
  end
end
