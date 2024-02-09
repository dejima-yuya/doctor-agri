class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :crop
end
