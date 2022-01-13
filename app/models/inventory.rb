class Inventory < ApplicationRecord
  belongs_to :character
  validates :item, presence: true
  validates :quantity, presence: true
end