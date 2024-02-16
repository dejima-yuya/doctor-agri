class Training < ApplicationRecord
  belongs_to :crop
  belongs_to :category
  
  validates :title, :content, presence: true
end
