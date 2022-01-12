class Character < ApplicationRecord
  belongs_to :user
  has_many :inventories, dependent: :destroy
  validates :name, presence: true
  validates :role, presence: true
  validates :health, presence: true
end