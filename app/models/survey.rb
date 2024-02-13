class Survey < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :is_useful, inclusion: [true, false]
  validates :is_request, inclusion: [true, false]
  validates :category_id, presence: true
  validates :crop_id, presence: true

  belongs_to :user
  belongs_to :category
  belongs_to :crop
end
