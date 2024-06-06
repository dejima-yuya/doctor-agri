class Training < ApplicationRecord
  belongs_to :category
  belongs_to :crop
  
  validates :title, :content, presence: true
end
