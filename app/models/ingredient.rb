class Ingredient < ActiveRecord::Base
  attr_accessible :nazwa, :kategoria
  has_and_belongs_to_many :pancakes

  validates :nazwa, :kategoria, :presence => {:message => 'to pole jest wymagane'}
end
