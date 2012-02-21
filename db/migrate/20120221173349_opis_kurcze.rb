class OpisKurcze < ActiveRecord::Migration
  def change
  change_column :lokals, :opis, :string
  end

end
