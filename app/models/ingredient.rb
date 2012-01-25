class Ingredient < ActiveRecord::Base

  belongs_to :pancake, :dependent => true
end
