class Category < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }

  has_many :surveys
  has_many :trainings, dependent: :destroy
end
