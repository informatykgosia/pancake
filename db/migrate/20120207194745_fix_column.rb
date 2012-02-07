class FixColumn < ActiveRecord::Migration
  def change
    rename_column :lokals, :link_zdjecie, :photo
  end

end
