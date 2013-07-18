class Item < ActiveRecord::Base
  attr_accessible :price, :name, :real, :weight, :description
  validates       :price, numericality: {:greater_than => 0, :allow_nil => 1}
  validates       :name, :description, :price, presence: true

  #belongs_to :category

  after_initialize {}       #Item.new, Item.first
  after_save{} #create,save,update_attributes
  after_create{}
  after_update{}
  after_destroy{}       #item.destroy

  has_many :positions
  has_many :carts, through:  :positions
  has_many :comments, as: :commentable
end
