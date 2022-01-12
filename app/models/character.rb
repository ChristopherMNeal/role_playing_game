class Character < ApplicationRecord
  belongs_to :users
  has_many :inventories, dependent: :destroy
end