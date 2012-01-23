class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :imie
      t.string :nazwisko
      t.string :crypted_password
      t.string :email
      t.string :rodzaj
      t.string :adres
      t.string :persistence_token
      t.boolean :admin

      t.timestamps
    end
  end
end
