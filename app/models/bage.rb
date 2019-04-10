class Bage < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true
  validates :image_url, presence: true
end
