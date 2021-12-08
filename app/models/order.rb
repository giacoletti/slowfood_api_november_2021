class Order < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: 'OrderItem'  # custom name
  has_many :products, through: :items

  def serialized
    serialization = self.as_json
    serialization.merge!(products: self.products.as_json)
  end
end
