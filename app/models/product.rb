class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
end
