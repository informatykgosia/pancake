class NoweKolumny < ActiveRecord::Migration
  def up
  add_column :comments, :user_id, :integer
  add_column :pancakes, :lokal_id, :integer
  add_column :lokals, :opis, :text
  add_column :pancakes, :nazwa, :string
  end
end
