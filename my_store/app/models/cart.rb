class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many   :positions
  has_many   :items, through:  :positions
end
