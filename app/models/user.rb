class User < ActiveRecord::Base
attr_accessible (:imie, :nazwisko, :e_mail, :adres)

email_check = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates (:imie, :presence => true,
          :length => { :minimum => 3 })
validates (:nazwisko, :presence => true,
          :length => { :minimum => 3 })
validates (:e_mail, :presence => true,
                     :format => { :with => email_check },
                      :uniqueness => { :case_sensitive => false } )

end
