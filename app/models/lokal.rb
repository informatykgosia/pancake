class Lokal < ActiveRecord::Base
  attr_accessible :nazwa, :adres, :photo, :ocena
  has_many :comments, :as => :commentable
  has_many :pancakes

  self.per_page= 10;
  validates :nazwa, :adres,  :presence => {:message => 'jest wymaganym polem'}
  mount_uploader :photo, PhotoUploader

  def self.search(query)
    if !query.to_s.strip.empty?
      tokens = query.split.collect{|c| "%#{c.downcase}"}
      where("lower(nazwa) like ? or lower(adres) like ?",[tokens]).order(created_on)
#      find_by_sql(["select s.* froms lokals s where #{ (["(lower(s.nazwa) like ? or lower(s.adres) like ?)"], tokens.size).join(" and ") } order by s.created_on_desc", *(tokens * 2).sort])
    else
      []
    end
  end

end
