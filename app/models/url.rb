class Url < ApplicationRecord

  validates :url, presence: true

  has_many :contents, dependent: :destroy

end
