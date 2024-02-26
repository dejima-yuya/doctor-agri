class Category < ApplicationRecord
  has_many :surveys, dependent: :destroy
  has_many :trainings, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
end
