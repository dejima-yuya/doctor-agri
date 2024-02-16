class Training < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :crop
  belongs_to :category
end
