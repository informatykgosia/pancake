class AddEMailUniquenessIndex < ActiveRecord::Migration
  def self.up
     add_index :users, :e_mail, :unique => true 
  end

  def self.down
    remove_index :users, :email
  end
end
