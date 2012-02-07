class Drpancake < ActiveRecord::Base
  validates_presence_of :title, :theory
end
