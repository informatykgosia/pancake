class CreateLokals < ActiveRecord::Migration
  def change
    create_table :lokals do |t|
      t.string :nazwa
      t.string :adres
      t.float :ocena
      t.string :link_zdjecie

      t.timestamps
    end
  end
end
