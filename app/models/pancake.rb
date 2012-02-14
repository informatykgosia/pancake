class Pancake < ActiveRecord::Base
  has_many :ingredients
  has_many :comments, :as => :commentable
  belongs_to :lokal, :dependent => true

end
