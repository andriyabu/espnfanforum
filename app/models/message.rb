class Message < ApplicationRecord
  belongs_to:user
  has_many :comments
  # has_rich_text :description
  validates :title, presence: true
  validates :description, presence: true
end
