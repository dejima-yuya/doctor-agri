class Training < ApplicationRecord
  validates :title, :content, presence: true
  validates :category_id, :crop_id, presence: true
  belongs_to :crop
  belongs_to :category
end
