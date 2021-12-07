class Order < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: 'OrderItem'  # custom name
  has_many :products, through: :items
end
