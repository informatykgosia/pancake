class OpisNalesnika < ActiveRecord::Migration
  def up
    add_column :pancakes, :opis, :string
  end

  def down
  end
end
