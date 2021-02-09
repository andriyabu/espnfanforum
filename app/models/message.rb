class Message < ApplicationRecord

  has_rich_text :description
  validates :title, presence: true
  validates :description, presence: true
end
