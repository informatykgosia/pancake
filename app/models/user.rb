class User < ActiveRecord::Base
  has_many :comments

  attr_protected :admin
  
  email_format = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :login, :email,  :presence => {:message => 'jest wymaganym polem'}
  validates :login, 
            :length => { :maximum => 50 }
  validates :email, 
            :format => { :with => email_format }

  acts_as_authentic do |config|
    config.crypted_password_field = :crypted_password
    config.require_password_confirmation = true
  end
end
