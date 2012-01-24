class Lokal < ActiveRecord::Base
  has_many :pancakes

  validates_presence_of :nazwa, :adres
  
  def self.search(query)
    if !query.to_s.strip.empty?
      tokens = query.split.collect {|c| "%#{c.downcase}$"}
      find_by_sql (["select s.* froms lokals s where #{ (["(lower(s.nazwa) like ? or lower(s.adres) like ?)"] tokens.size).join(" and ") } order by s.created_on_desc", *(tokens * 2).sort])
    else
      []
    end

end
