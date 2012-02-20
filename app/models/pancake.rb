class Pancake < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_many :comments, :as => :commentable
  belongs_to :lokal, :dependent => true

end
