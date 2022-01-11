class Character < ApplicationRecord
  has_many :inventories, dependent: :destroy
end