class Crop < ApplicationRecord
  has_many :surveys
  has_many :trainings, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
end
