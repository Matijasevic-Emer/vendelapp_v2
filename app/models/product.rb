class Product < ApplicationRecord
  has_one_attached :photo
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  belongs_to :category

  # Ordenar productos
  ORDER_BY = {
    newest: "created_at DESC",
    cheapest: "price ASC",
    expensivest: "price DESC"
  }
end
