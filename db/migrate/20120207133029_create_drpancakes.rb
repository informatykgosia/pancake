class CreateDrpancakes < ActiveRecord::Migration
  def change
    create_table :drpancakes do |t|
      t.string :title
      t.text :theory

      t.timestamps
    end
  end
end
