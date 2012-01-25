class Pancake < ActiveRecord::Base
  has_many :ingredients
  belongs_to :lokal, :dependent => true

end
