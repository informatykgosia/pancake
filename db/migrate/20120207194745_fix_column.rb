class FixColumn < ActiveRecord::Migration
  def change
    rename_column :lokals, :link_zdjecie, :photo
  end
  
  def up
    add_column :comments, :user_id, :integer
    add_column :pancakes, :lokal_id, :integer
    add_column :ingredients, :pancake_id, :integer
  end

end
