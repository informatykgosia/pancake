user = User.new(:login => 'admin', :password => 'password',
                :password_confirmation => 'password', :email => 'my@email.com')

user.save
user.update_attribute(:admin,true)
