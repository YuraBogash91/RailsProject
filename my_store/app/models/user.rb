class User < ActiveRecord::Base


  attr_accessible :login
  has_one         :cart
  has_many        :orders
end
