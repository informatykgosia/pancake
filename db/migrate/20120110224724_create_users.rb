class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :imie
      t.string :nazwisko
      t.string :haslo
      t.string :e_mail
      t.string :rodzaj
      t.string :adres

      t.timestamps
    end
  end
end
