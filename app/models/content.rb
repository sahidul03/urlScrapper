class Content < ApplicationRecord
  validates :tag, presence: true
  validates :content, presence: true

  belongs_to :level
end
