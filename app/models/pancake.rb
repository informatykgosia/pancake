class Pancake < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_many :comments, :as => :commentable
  belongs_to :lokal
  
  self.per_page = 10
  validates :nazwa, :polewa, :cena, :opis,  :presence => { :message => 'to pole jest wymagane' }

end
