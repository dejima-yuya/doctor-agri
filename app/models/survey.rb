class Survey < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :is_useful, presence: true
  validates :is_request, presence: true
  validates :category_id, presence: true
  validates :crop_id, presence: true

  belongs_to :user
  belongs_to :category
  belongs_to :crop
end
